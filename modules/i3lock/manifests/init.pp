class i3lock (
  String[1] $package,
  Stdlib::Absolutepath $command,
) {
  package { $package:
    ensure => 'installed',
  }
}
