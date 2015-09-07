# == Class elixir::install
#
class elixir::install {

  # Include archive class to install required faraday gems
  include ::archive

  $install_source = $elixir::source_url
  $install_file = inline_template('<%=File.basename(URI::parse(@install_source).path)%>')

  file { $elixir::destination:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  } ->
  archive { "/tmp/${install_file}":
    source       => $elixir::source_url,
    extract      => true,
    extract_path => $elixir::destination,
    creates      => "${elixir::destination}/bin/elixir",
  }

  file { '/usr/bin/elixir':
    ensure  => 'link',
    target  => "${elixir::destination}/bin/elixir",
    require => Archive["/tmp/${install_file}"],
  }

  file { '/usr/bin/elixirc':
    ensure  => 'link',
    target  => "${elixir::destination}/bin/elixirc",
    require => Archive["/tmp/${install_file}"],
  }

  file { '/usr/bin/iex':
    ensure  => 'link',
    target  => "${elixir::destination}/bin/iex",
    require => Archive["/tmp/${install_file}"],
  }

  file { '/usr/bin/mix':
    ensure  => 'link',
    target  => "${elixir::destination}/bin/mix",
    require => Archive["/tmp/${install_file}"],
  }
}
