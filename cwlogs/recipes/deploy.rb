# run this one at deploy (this one is necessary in case of app-specific logs being added)

template "/var/awslogs/etc/awslogs.conf" do
  source "cwlogs.cfg.erb"
  owner "root"
  group "root"
  mode 0664
end

service "awslogs" do
  supports :restart => true
  action :enable
  subscribes :restart, "template[/var/awslogs/etc/awslogs.conf]", :immediately
end
