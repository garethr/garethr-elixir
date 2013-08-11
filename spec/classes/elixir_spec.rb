require 'spec_helper'

describe 'elixir' do
  context 'supported operating systems' do
    describe "elixir class without any parameters" do
      let(:facts) {{
        :osfamily => 'Debian',
        :lsbdistcodename => 'precise',
      }}

      it { should include_class('elixir::params') }
      it { should contain_class('elixir::install') }
      it { should include_class('erlang') }

      it { should contain_wget__fetch('download_elixir').with_source('https://github.com/elixir-lang/elixir/releases/download/v0.10.0/v0.10.0.zip') }
      it { should contain_exec('unzip_elixir')}

      context 'passing a version number' do
        let(:params) { {'version' => '1.0.0'} }
        it { should contain_wget__fetch('download_elixir').with_source('https://github.com/elixir-lang/elixir/releases/download/v1.0.0/v1.0.0.zip') }
      end
    end
  end


  context 'unsupported operating system' do
    describe 'elixir class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end

  context 'invalid version param' do
    describe 'elixir class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily => 'Debian',
        :lsbdistcodename => 'precise',
      }}

      let(:params) { {'version' => true} }
      it { expect { should }.to raise_error(Puppet::Error, /true is not a string/) }
    end
  end

end
