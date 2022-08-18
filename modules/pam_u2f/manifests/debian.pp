class pam_u2f::debian {
  file { '/usr/share/pam-configs/u2f':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/pam_u2f/u2f',
    notify => Exec['/usr/sbin/pam-auth-update --enable u2f'],
  }

  exec { '/usr/sbin/pam-auth-update --enable u2f':
    refreshonly => true,
  }
}
