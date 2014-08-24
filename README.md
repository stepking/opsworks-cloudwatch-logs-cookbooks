opsworks-cloudwatch-logs-cookbooks
==================================
## HOW TO USE
 1. Configure your opsworks role with access to cloudwatch logs (see policy JSON below)
 2. Include the cwlogs cookbook in your custom cookbook repo
 3. Update your layers to add custom recipes. For "Setup" add "cwlogs", for "Deploy" add "cwlogs::deploy"

In order to add more logs, use a custom JSON. This can either be a stack JSON or a deploy-time JSON in Opsworks. For example, to add dmesg, you could use the following:

```json 	
{ "cwlogs" : { "logfiles" : {"dmesg" : "/var/log/dmesg" } } }
```

## IMPORTANT

In order to use this cookbook, you'll need to ensure that the following policy has been added to the Opsworks service role:
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:GetLogEvents",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Resource": [
        "arn:aws:logs:us-east-1:*:*"
      ]
    }
  ]
}
```

