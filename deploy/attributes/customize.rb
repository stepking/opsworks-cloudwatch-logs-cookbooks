node[:opsworks][:applications].each do |application|
  normal[:deploy][application[:name]][:deploy_to] = "/var/log/#{application[:deploy_to]"
end
