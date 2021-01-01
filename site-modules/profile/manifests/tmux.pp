class profile::tmux {
  $version = fact('tmux_version')

  file { "${fact('home')}/.tmux.conf":
    ensure  => file,
    owner   => '0644',
    content => epp('profile/dot.tmux.conf'),
  }
}
