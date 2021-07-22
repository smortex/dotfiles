class profile::git {
  file { "${fact('home')}/.gitconfig":
    ensure => file,
    mode   => '0644',
    source => 'puppet:///modules/profile/dot.gitconfig',
  }
}
