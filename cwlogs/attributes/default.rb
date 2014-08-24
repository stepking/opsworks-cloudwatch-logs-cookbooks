

default[:cwlogs][:logfile] = '/var/log/aws/opsworks/opsworks-agent.log'

default[:cwlogs][:logfiles] = {}
default[:cwlogs][:installer] = "awslogs-agent-setup.py"
default[:cwlogs][:installer_url] = "https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/#{node[:cwlogs][:installer]}"
default[:cwlogs][:directory] = "/opt/aws/cloudwatch"
default[:cwlogs][:cw_region] = "us-east-1"


default[:cwlogs][:logfiles]["opsworks_agent"] = "/var/log/aws/opsworks/opsworks-agent.log"
default[:cwlogs][:logfiles]["messages"] = "/var/log/messages"
default[:cwlogs][:logfiles]["error_log"] = "/var/log/httpd/error_log"
default[:cwlogs][:logfiles]["access_log"] = "/var/log/httpd/access_log"

