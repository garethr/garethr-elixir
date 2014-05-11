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

  file { '/usr/bin/elixir':
    ensure => 'link',
    target => '/opt/elixir/bin/elixir',
    require => Exec['unzip_elixir']
  }

  file { '/usr/bin/elixirc':
    ensure => 'link',
    target => '/opt/elixir/bin/elixirc',
    require => Exec['unzip_elixir']
  }

  file { '/usr/bin/iex':
    ensure => 'link',
    target => '/opt/elixir/bin/iex',
    require => Exec['unzip_elixir']
  }

  file { '/usr/bin/mix':
    ensure => 'link',
    target => '/opt/elixir/bin/mix',
    require => Exec['unzip_elixir']
  }
}
