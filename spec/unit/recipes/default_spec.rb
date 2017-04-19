#
# Cookbook:: lcd_web
# Spec:: default
#
# Copyright:: 2017, Kaab Nedaria, All Rights Reserved.

require 'spec_helper'

describe 'lcd_web::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
