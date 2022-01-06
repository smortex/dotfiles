class sysconfig::yubikey {
  include i3lock
  include xautolock

  file { '/etc/udev/rules.d/20-yubikey.rules':
    ensure  => file,
    owner   => 'root',
    group   => '0',
    content => @(RULE)
      ACTION=="remove", ENV{ID_BUS}=="usb", ENV{ID_MODEL_ID}=="0407", ENV{ID_VENDOR_ID}=="1050", RUN+="/usr/local/bin/lockscreen.sh"
      | RULE
  }

  exec { '/usr/bin/udevadm control --reload':
    refreshonly => true,
    subscribe   => File['/etc/udev/rules.d/20-yubikey.rules'],
  }

  file { '/usr/local/bin/lockscreen.sh':
    ensure  => file,
    owner   => 'root',
    group   => '0',
    content => @(SCRIPT)
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
      | SCRIPT
  }
}
