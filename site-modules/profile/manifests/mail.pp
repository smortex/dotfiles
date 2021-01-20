class profile::mail (
  Array[String[1]] $alternates = [],
  Array[String[1]] $subscribes = [],
  Optional[String] $imap_url = undef,
  Optional[String] $imap_user = undef,
  Optional[Sensitive] $imap_pass = undef,
  String $spoolfile = '+INBOX',
  Optional[String] $record = undef,
  Optional[String] $postponed = undef,
  Optional[String] $smtp_url = undef,
  Optional[Sensitive] $smtp_pass = undef,
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
    source => [
      "puppet:///modules/profile/mail/dot.signature.${facts['customer']}",
      'puppet:///modules/profile/mail/dot.signature',
    ]
  }
}
