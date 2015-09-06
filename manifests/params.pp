# == Class elixir::params
#
# This class is meant to be called from elixir
# It sets variables according to platform
#
class elixir::params {
  $version = '1.0.5'
  $source_url = "https://github.com/elixir-lang/elixir/releases/download/v${version}/precompiled.zip"
  $destination = '/opt/elixir'
}
