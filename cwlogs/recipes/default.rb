#Create cfg file
template "/tmp/cwlogs.cfg" do
  source "cwlogs.cfg.erb"
  owner "root"
  group "root"
  mode 0644
end

#create path for cwlogs config
directory "#{node[:cwlogs][:directory]}" do
 recursive true
end

#download installer
remote_file "#{node[:cwlogs][:directory]}/#{node[:cwlogs][:installer]}" do
  source node[:cwlogs][:installer_url]
  mode "0755"
end

#install if  not already installed
execute "Install CloudWatch Logs agent" do
  command "#{node[:cwlogs][:directory]}/#{node[:cwlogs][:installer]} -n -r #{node[:cwlogs][:cw_region]} -c /tmp/cwlogs.cfg"
#  not_if { system "pgrep -f aws-logs-agent-setup" }
end

#service "awslogs" do
#  supports :restart =>true
#  action :enable
#  subscribes :restart, "template[/tmp/cwlogs.cfg", :immediately
#end

