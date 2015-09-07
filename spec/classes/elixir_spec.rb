require 'spec_helper'

describe 'elixir' do
  context 'supported operating systems' do
    describe "elixir class without any parameters" do
      let(:facts) {{
        :osfamily => 'Debian',
        :lsbdistid => 'debian',
        :lsbdistcodename => 'precise',
      }}

      it { should contain_class('elixir::install') }

      it do
        should contain_archive('/tmp/precompiled.zip').with(
          'extract' => true,
          'extract_path' => '/opt/elixir',
          'creates' => '/opt/elixir/bin/elixir',
        )
      end 

      context 'passing a version number' do
        let(:params) { {'version' => '0.13.2'} }
        it do
          should contain_archive('/tmp/precompiled.zip').with(
            'extract' => true,
            'extract_path' => '/opt/elixir',
            'creates' => '/opt/elixir/bin/elixir',
          )
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
