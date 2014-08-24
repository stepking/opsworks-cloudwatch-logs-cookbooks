

default[:cwlogs][:logfile] = '/var/log/aws/opsworks/opsworks-agent.log'

default[:cwlogs][:logfiles] = ['/var/log/aws/opsworks/opsworks-agent.log']
default[:cwlogs][:installer] = "awslogs-agent-setup.py"
default[:cwlogs][:installer_url] = "https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/#{node[:cwlogs][:installer]}"
default[:cwlogs]["directory"] = "/opt/aws/cloudwatch"
default[:cwlogs][:cw_region] = "us-east-1"
