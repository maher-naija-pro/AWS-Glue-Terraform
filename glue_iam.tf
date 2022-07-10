resource "aws_iam_role" "glue" {
  name = format(
          "%s-%s-glue-iam",
           var.project_name,
           var.platforme_name,
         )
  assume_role_policy = <<-JSON
{

  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service":  [
        "glue.amazonaws.com"
      ]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
JSON
}

resource "aws_iam_policy" "glue-access" {
  name   = format(
          "%s-%s-glue-job-access",
           var.project_name,
           var.platforme_name,
         )
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "s3:*"
            ],
            "Resource": "*",
            "Effect": "Allow"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "glue-access" {
policy_arn = aws_iam_policy.glue-access.arn
role       = aws_iam_role.glue.name
}
