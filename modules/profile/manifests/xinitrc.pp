class profile::xinitrc {
  file { "${fact('home')}/.xinitrc":
    ensure  => file,
    mode    => '0644',
    content => epp('profile/dot.xinitrc'),
  }
}
