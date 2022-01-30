# Manage git configuration
class profile::git (
  Profile::Gitconfig::Sections $default_settings = {},
  Profile::Gitconfig::Includes $include_settings = {},
) {
  $default_settings.each |$section, $settings| {
    $settings.each |$setting, $value| {
      gitconfig { "gitconfig-${section}-${setting}":
        ensure  => present,
        section => $section,
        setting => $setting,
        value   => $value,
        path    => "${fact('home')}/.gitconfig",
      }
    }
  }

  $include_settings.each |$fragment, $config| {
    gitconfig { "gitconfig-${fragment}":
      ensure  => present,
      section => "includeIf \"gitdir:${$config['path']}\"",
      setting => 'path',
      value   => "${fact('home')}/.gitconfig-${fragment}",
      path    => "${fact('home')}/.gitconfig",
    }

    $config['settings'].each |$section, $settings| {
      $settings.each |$setting, $value| {
        gitconfig { "gitconfig-${fragment}-${section}-${setting}":
          ensure  => present,
          section => $section,
          setting => $setting,
          value   => $value,
          path    => "${fact('home')}/.gitconfig-${fragment}",
        }
      }
    }
  }
}
