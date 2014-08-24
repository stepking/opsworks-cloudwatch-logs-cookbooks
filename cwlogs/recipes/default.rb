#create path for cwlogs config
directory "#{node[:cwlogs][:directory]}" do
 recursive true
end

#download installer
remote_file "#{node[:cwlogs][:directory]}/#{node[:cwlogs][:installer]}" do
  source "#{node[:cwlogs][:installer_url]}#{node[:cwlogs][:installer]}"
  mode "0755"
end

#Create cfg file
template "#{node[:cwlogs][:directory]}/cwlogs.cfg" do
  source "cwlogs.cfg.erb"
  owner "root"
  group "root"
  mode 0644
end

#install if  not already installed
execute "Install CloudWatch Logs agent" do
  command "#{node[:cwlogs][:directory]}/#{node[:cwlogs][:installer]} -n -r #{node[:cwlogs][:cw_region]} -c #{node[:cwlogs][:directory]}/cwlogs.cfg"
  not_if { Dir.exists?('/var/awslogs') }
end
