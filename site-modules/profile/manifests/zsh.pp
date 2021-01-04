# vim:set filetype=puppet:
class profile::zsh {
  file { "${fact('home')}/.zshrc":
    ensure  => file,
    mode    => '0644',
    content => epp('profile/dot.zshrc'),
  }
}
