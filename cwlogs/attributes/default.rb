#Default Attributes

#installation defaults
default[:cwlogs][:installer] = "awslogs-agent-setup.py"
default[:cwlogs][:installer_url] = "https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/"
default[:cwlogs][:directory] = "/opt/aws/cloudwatch"

#currently only cwlogs has an endpoint in us-east-1
default[:cwlogs][:cw_region] = "us-east-1"

#used to add more logs to monitor
default[:cwlogs][:logfiles] = {}

#opsworks logs
default[:cwlogs][:logfiles]["opsworks_agent"] = "/var/log/aws/opsworks/opsworks-agent.log"

#Create certain basic logs depending on OS in use
case platform_family
when "rhel" 
#amazon linux common logs
  default[:cwlogs][:logfiles]["messages"] = "/var/log/messages"
  default[:cwlogs][:logfiles]["error_log"] = "/var/log/httpd/*error.log"
  default[:cwlogs][:logfiles]["access_log"] = "/var/log/httpd/*access.log"
when "debian"
#ubuntu common logs
  default[:cwlogs][:logfiles]["syslog"] = "/var/log/syslog"
  default[:cwlogs][:logfiles]["error_log"] = "/var/log/apache2/*error.log"
  default[:cwlogs][:logfiles]["access_log"] = "/var/log/apache2/*access.log"
end
