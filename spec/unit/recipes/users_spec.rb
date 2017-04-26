#
# Cookbook:: lcd_web
# Spec:: default
#
# Copyright:: 2017, Kaab Nedaria, All Rights Reserved.

require 'spec_helper'

describe 'lcd_web::users' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2.1511')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates the group' do
      expect { chef_run }.to create_group('developers')
    end

    it 'creates the user' do
      expect { chef_run }.to create_user('webadmin').with(group: 'developers')
      its
    end
  end
end
