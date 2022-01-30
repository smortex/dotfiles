class profile::most {
  if fact('most_path') {
    file { "${fact('home')}/.mostrc":
      ensure  => file,
      mode    => '0644',
      content => epp('profile/dot.mostrc'),
    }
  }
}
