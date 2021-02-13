provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role" "this" {
  name = "tf_go_blank"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


# -----------------------------------------------------------------------------
# AWS managed policies to lambda
# -----------------------------------------------------------------------------

resource "aws_iam_role_policy_attachment" "AWSLambdaBasicExecutionRole" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "AWSLambdaReadOnlyAccess" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "AWSXrayWriteOnlyAccess" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/AWSXrayWriteOnlyAccess"
}

data "archive_file" "zip" {
  type        = "zip"
  source_file = "bin/tf_go_blank"
  output_path = "tf_go_blank.zip"
}

resource "aws_lambda_function" "this" {
  filename         = "tf_go_blank.zip"
  function_name    = "tf_go_blank"
  role             = aws_iam_role.this.arn
  handler          = "tf_go_blank"
  memory_size      = 128
  source_code_hash = filebase64sha256("tf_go_blank.zip")

  runtime = "go1.x"
  tracing_config {
    mode = "Active"
  }
  environment {
    variables = {
      foo = "bar"
    }
  }
}
