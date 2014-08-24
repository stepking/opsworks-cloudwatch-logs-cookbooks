opsworks-cloudwatch-logs-cookbooks
==================================
HOW TO USE:
 1. Configure your opsworks role with access to cloudwatch logs (see policy JSON below)
 2. Include the cwlogs cookbook in your custom cookbook repo
 3. Update your layers to add custom recipes. For "Setup" add "cwlogs", for "Deploy" add "cwlogs::deploy"

IMPORTANT:

In order to use this cookbook, you'll need to ensure that the following policy has been added to the Opsworks service role:

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

