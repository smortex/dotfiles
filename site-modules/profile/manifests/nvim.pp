class profile::nvim {
  file { "${fact('home')}/.config/nvim":
    ensure => directory,
  }

  file { "${fact('home')}/.config/nvim/init.vim":
    ensure => file,
    source => 'puppet:///modules/profile/nvim/init.vim',
    notify  => Exec['plug-install'],
  }

  file { "${fact('home')}/.config/nvim/autoload":
    ensure => directory,
  }

  file { "${fact('home')}/.config/nvim/autoload/plug.vim":
    ensure  => file,
    replace => false,
    source  => 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim',
    notify  => Exec['plug-install'],
  }

  exec { "plug-install":
    command     => 'nvim --headless +PlugInstall +qa',
    provider    => 'shell',
    path        => '/usr/local/bin:/usr/bin:/bin',
    environment => [
      "HOME=${fact('home')}",
    ],
    refreshonly => true,
  }
}
