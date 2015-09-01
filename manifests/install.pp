# == Class elixir::install
#
class elixir::install {
  include elixir::params
  class { 'erlang' :
  } ->
  package { 'elixir':
    ensure => $elixir::version,
  }
}
