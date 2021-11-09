class profile::nvim {
  file { "${fact('home')}/.config/nvim":
    ensure => directory,
  }

  file { "${fact('home')}/.config/nvim/init.vim":
    ensure => file,
    source => 'puppet:///modules/profile/nvim/init.vim',
  }

  file { "${fact('home')}/.config/nvim/autoload":
    ensure => directory,
  }

  file { "${fact('home')}/.config/nvim/autoload/plug.vim":
    ensure => file,
    source => 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim',
  }
}
