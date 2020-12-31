class profile::tmux {
  $version = '2.8'

  file { "${fact('home')}/.tmux.conf":
    ensure  => file,
    owner   => '0644',
    content => epp('profile/dot.tmux.conf'),
  }
}
