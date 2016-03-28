#
# Cookbook Name:: al_agents
# Recipe:: provision
#
# Copyright 2015, AlertLogic
#

::Chef::Recipe.send(:include, AlAgents::Helpers)
::Chef::Resource.send(:include, AlAgents::Helpers)

execute "provision #{agent_basename}" do
  user 'root'
  cwd '/etc/init.d'
  command "./al-agent provision #{provision_options}"
  not_if { ::File.exist?('/var/alertlogic/etc/host_key.pem') }
end
