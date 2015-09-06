# == Class: elixir
#
# Full description of class elixir here.
#
# === Parameters
#
# [*version*]
#   Version string used to find zip file from Github release
#
# [*source_url*]
#   The precompiled.zip source URL, defaults to Github
#
# [*destination*]
#    The destination to which the precomplied.zip
#    will be extracted
#
class elixir (
  $version     = $elixir::params::version,
  $source_url  = $elixir::params::source_url,
  $destination = $elixir::params::destination,
) inherits elixir::params {

  validate_string($version)

  include elixir::install
}
