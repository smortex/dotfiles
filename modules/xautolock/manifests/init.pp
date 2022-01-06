class xautolock (
  String[1] $package,
  Stdlib::Absolutepath $command,
) {
  package { $package:
    ensure => 'installed',
  }
}
