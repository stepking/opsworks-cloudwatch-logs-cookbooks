opsworks-cloudwatch-logs-cookbooks
==================================

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

