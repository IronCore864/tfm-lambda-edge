resource "aws_iam_role" "lambda_edge_role" {
  name = "lambda_edge_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": ["lambda.amazonaws.com", "edgelambda.amazonaws.com"]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_edge_cloudwatch" {
  role       = aws_iam_role.lambda_edge_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "origin_request" {
  publish       = true
  function_name = "${var.naming_prefix}_origin_request"
  role          = aws_iam_role.lambda_edge_role.arn
  s3_bucket     = var.s3_bucket
  s3_key        = "origin_request.zip"
  handler       = "main.handler"
  runtime       = "python3.7"
}

resource "aws_lambda_function" "basic_auth" {
  publish       = true
  function_name = "${var.naming_prefix}_basic_auth"
  role          = aws_iam_role.lambda_edge_role.arn
  s3_bucket     = var.s3_bucket
  s3_key        = "basic_auth.zip"
  handler       = "main.handler"
  runtime       = "python3.7"
}

resource "aws_lambda_function" "cookie_plant" {
  publish       = true
  function_name = "${var.naming_prefix}_cookie_plant"
  role          = aws_iam_role.lambda_edge_role.arn
  s3_bucket     = var.s3_bucket
  s3_key        = "cookie_plant.zip"
  handler       = "main.handler"
  runtime       = "python3.7"
}

