class profile::gnupg (
  String[1] $default_key = '82349A78E7C0B8070B5980FFBA4D1D955112336F',
) {
  file { "${fact('home')}/.gnupg":
    ensure => directory,
    mode   => '0700',
  }

  file { "${fact('home')}/.gnupg/gpg.conf":
    ensure => file,
  }

  file_line { 'gpg.conf-default_key':
    line  => "default-key ${default_key}",
    match => '^default-key ',
    path  => "${fact('home')}/.gnupg/gpg.conf",
  }
}
