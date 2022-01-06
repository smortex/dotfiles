class profile::xresources {
  include i3lock
  include notify_send

  file { "${fact('home')}/.Xresources":
    ensure  => file,
    mode    => '0644',
    content => epp('profile/dot.Xresources.epp'),
  }
}
