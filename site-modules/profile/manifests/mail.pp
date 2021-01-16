class profile::mail (
  Array[String[1]] $alternates = [],
) {
  file { "${fact('home')}/.mailcap":
    ensure => file,
    mode   => '0644',
    source => 'puppet:///modules/profile/mail/dot.mailcap',
  }

  file { "${fact('home')}/.muttrc":
    ensure  => file,
    mode    => '0400',
    content => epp('profile/dot.muttrc'),
  }

  file { "${fact('home')}/.signature":
    ensure => file,
    mode   => '0644',
    source => 'puppet:///modules/profile/mail/dot.signature',
  }
}
