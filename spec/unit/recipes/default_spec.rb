#
# Cookbook:: lcd_web
# Spec:: default
#
# Copyright:: 2017, Kaab Nedaria, All Rights Reserved.

require 'spec_helper'

describe 'lcd_web::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2.1511')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  
    it 'install httpd' do
	     expect(chef_run).to install_package('httpd')
    end

    it 'enables the httpd service do' do
	     expect(chef_run).to enable_service('httpd')
    end

    it 'starts the httpd service' do
	     expect(chef_run).to start_service('httpd')
    end
   
    it 'install net-tools' do
	     expect(chef_run).to install_package('net-tools')
    end
  end
end
