class profile::gnupg (
  String[1] $gnupghome = "${fact('home')}/.gnupg",
  String[1] $default_key = '82349A78E7C0B8070B5980FFBA4D1D955112336F',
) {
  file { $gnupghome:
    ensure => directory,
    mode   => '0700',
  }

  file { "${gnupghome}/dirmngr.conf":
    ensure  => file,
    content => @(DIRMNGR),
      # standard-resolver
      keyserver hkps://keys.openpgp.org
      | DIRMNGR
  }

  file { "${gnupghome}/gpg-agent.conf":
    ensure  => file,
    content => @(GPG_AGENT),
      pinentry-program /usr/local/bin/pinentry-curses
      default-cache-ttl 3600
      max-cache-ttl 14400
      | GPG_AGENT
  }

  file { "${gnupghome}/gpg.conf":
    ensure => file,
  }

  file_line { 'gpg.conf-default_key':
    line  => "default-key ${default_key}",
    match => '^default-key ',
    path  => "${gnupghome}/gpg.conf",
  }

  file { "${gnupghome}/scdaemon.conf":
    ensure  => file,
    content => @(SCDAEMON)
      # Rely on pcscd to talk to the Yubikey SmartCard
      disable-ccid
      | SCDAEMON
  }
}
