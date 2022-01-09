class sysconfig::yubikey {
  include i3lock
  include xautolock

  case fact('os.family') {
    'debian': {
      $lock_script = @(SH)
        #!/bin/sh

        for x in /tmp/.X11-unix/*; do
          user=$(stat -c %U $x)

          user_display=$(basename $x)
          user_display=${user_display#X}

          user_home=$(getent passwd $user | cut -d ':' -f 6)

          if pgrep -u $user xautolock; then
            XAUTHORITY="$user_home/.Xauthority"
            DISPLAY=":$user_display"
            sudo -u $user env XAUTHORITY="$XAUTHORITY" DISPLAY="$DISPLAY" xautolock -locknow
          fi
        done
        | SH

      file { '/etc/udev/rules.d/20-yubikey.rules':
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        content => @(RULE)
          ACTION=="remove", ENV{ID_BUS}=="usb", ENV{ID_VENDOR_ID}=="1050", RUN+="/usr/local/bin/lockscreen.sh"
          | RULE
      }

      exec { '/usr/bin/udevadm control --reload':
        refreshonly => true,
        subscribe   => File['/etc/udev/rules.d/20-yubikey.rules'],
      }
    }
    'freebsd': {
      $lock_script = @(SH)
        #!/bin/sh

        for pid in $(pgrep xautolock); do
          env=$(penv $pid | awk '$2 ~ /^(DISPLAY|USER|XAUTHORITY)=/ { print $2 }')

          user=$(echo "$env" | awk -F= '$1 == "USER" { print $2 }')

          sudo -u $user env $env xautolock -locknow
        done
        | SH

      file { '/usr/local/etc/devd/yubikey.conf':
        ensure  => file,
        owner   => 'root',
        group   => 'wheel',
        content => @(CONF)
          notify 110 {
            match "system"     "USB";
            match "subsystem"  "DEVICE";
            match "type"       "DETACH";
            match "vendor"     "0x1050";
            action "/usr/local/bin/lockscreen.sh";
          };
          | CONF
      }

      service { 'devd':
        ensure    => running,
        subscribe => File['/usr/local/etc/devd/yubikey.conf'],
      }
    }
  }

  file { '/usr/local/bin/lockscreen.sh':
    ensure  => file,
    owner   => 'root',
    group   => '0',
    mode    => '0755',
    content => $lock_script,
  }
}
