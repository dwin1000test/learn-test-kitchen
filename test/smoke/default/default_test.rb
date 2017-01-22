# # encoding: utf-8

# Inspec test for recipe learn_chef_apache2::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  describe user('root') do
    it { should exist }
    skip 'This is an example test, replace with your own test.'
  end
end

describe package 'apache2' do
    it { should be_installed }
end

describe service 'apache2' do
    it { should be_enabled }
    it { should be_running }
end

describe port(80) do
  it { should be_listening }
  #skip 'This is an example test, replace with your own test.'
end

describe command 'curl localhost' do
    its('stdout') { should match /Hello World/ }
end


