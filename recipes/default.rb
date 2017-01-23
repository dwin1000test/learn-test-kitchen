#
# Cookbook:: learn_chef_apache2
# Recipe:: default
#
# Copyright:: 2016, The Authors, All Rights Reserved.

apt_update 'Update the apt cache daily' do
    frequency 86_400
    action :periodic
end

package_name = 
    service_name = 
        case node['platform_family']
            when 'rhel' then 'httpd'
            when 'debian' then 'apache2'
        end

#Installs 
package package_name

service service_name do
    supports :status => true
    action [:enable, :start]
end

group 'web_admin'

user 'web_admin' do
    group 'web_admin'
    system true
    shell '/bin/bash'
end

template '/var/www/html/index.html' do
    source 'index.html.erb'
    mode '0644'
    owner 'web_admin'
    group 'web_admin'
end
