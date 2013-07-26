require 'spec_helper'

describe 'elixir' do
  context 'supported operating systems' do
    describe "elixir class without any parameters" do
      let(:params) {{ }}
      let(:facts) {{
        :osfamily => 'Debian',
        :lsbdistcodename => 'precise',
      }}

      it { should include_class('elixir::params') }
      it { should contain_class('elixir::install') }
      it { should include_class('erlang') }
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
end
