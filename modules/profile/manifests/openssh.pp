class profile::openssh {
  file { "${fact('home')}/.ssh":
    ensure => directory,
    mode   => '0700',
  }

  file { "${fact('home')}/.ssh/config":
    ensure => file,
    mode   => '0644',
    source => 'puppet:///modules/profile/openssh/config',
  }
}
