# == Class: elixir
#
# Full description of class elixir here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class elixir (
) inherits elixir::params {

  # validate parameters here

  class { 'elixir::install': } ->
  Class['elixir']
}
