directory "#{node[:cwlogs][:directory]}" do
 recursive true
end

remote_file "#{node[:cwlogs][:directory]}/#{node[:cwlogs][:installer]}" do
  source node[:cwlogs][:installer_url]
  mode "0755"
end

execute "Install CloudWatch Logs agent" do
  command "#{node[:cwlogs][:directory]}/#{node[:cwlogs][:installer]} -n -r #{node[:cwlogs][:cw_region]} -c /tmp/cwlogs.cfg"
  not_if { system "pgrep -f aws-logs-agent-setup" }
end
