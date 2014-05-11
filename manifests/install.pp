# == Class elixir::install
#
class elixir::install {
  include elixir::params
  include 'erlang'

  ensure_packages(['unzip'])

  wget::fetch { 'download_elixir':
    source      => "https://github.com/elixir-lang/elixir/releases/download/v${elixir::version}/precompiled.zip",
    destination => '/tmp/elixir.zip',
    before      => Exec['unzip_elixir'],
  }

  exec { 'unzip_elixir':
    command => '/usr/bin/unzip elixir.zip -d /opt/elixir',
    cwd     => '/tmp',
    creates => '/opt/elixir',
  }

  file { '/usr/bin':
    ensure => 'link',
    target => '/opt/elixir/*',
    require => Exec['unzip_elixir']
  }
}
