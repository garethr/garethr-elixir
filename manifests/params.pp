# == Class elixir::params
#
# This class is meant to be called from elixir
# It sets variables according to platform
#
class elixir::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'elixir'
      $service_name = 'elixir'
    }
    'RedHat', 'Amazon': {
      $package_name = 'elixir'
      $service_name = 'elixir'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
