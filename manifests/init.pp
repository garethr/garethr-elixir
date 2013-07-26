# == Class: elixir
#
# Full description of class elixir here.
#
# === Parameters
#
# [*version*]
#   Version string used to find zip file from Github release
#
class elixir (
  $version = $elixir::params::version
) inherits elixir::params {

  validate_string($version)

  class { 'elixir::install': } ->
  Class['elixir']
}
