#
# Cookbook:: learn_chef_apache2
# Spec:: default
#
# Copyright:: 2016, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'learn-test-kitchen::default' do
  context 'When attributes are on CentOs 7' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2.1511')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs httpd' do
      expect(chef_run).to install_package 'httpd'
    end
 
    it 'enables the httpd service' do
      expect(chef_run).to enable_service 'httpd'
    end

    it 'starts the httpd service' do
      expect(chef_run).to start_service 'httpd'
    end
  end
end
