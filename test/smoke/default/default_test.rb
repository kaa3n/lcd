# # encoding: utf-8

# Inspec test for recipe lcd_web::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# unless os.windows?
#  describe user('root') do
#    it { should exist }
#    skip 'This is an example test, replace with your own test.'
#  end
# end

# describe port(80) do
#  it { should_not be_listening }
#  skip 'This is an example test, replace with your own test.'
# end
#

['net-tools', 'httpd'].each do |pkg|
  describe package(pkg) do
    it { should be_installed } 
  end
end

describe package('php-cli') do
  it { should be_installed }
end

