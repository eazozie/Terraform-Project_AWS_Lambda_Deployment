# IAM role for Lambda execution
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "lambda_function_role" {
  name               = "${var.lambda_function_name}_execution_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}


# Package the Lambda function code
data "archive_file" "zip" {
  type        = "zip"
  source_file = "lambda_function.py"
  output_path = "lambda_function.zip"
}

# Lambda function
resource "aws_lambda_function" "demo" {
  filename         = data.archive_file.zip.output_path
  function_name    = var.lambda_function_name
  role             = aws_iam_role.lambda_function_role.arn  #attaching the role to the function
  handler          = "lambda_function.lambda_handler"
  source_code_hash = data.archive_file.zip.output_base64sha256  # hash to track changes

  runtime = "python3.12"



  tags = {
    Environment = "dev"
    Application = "demo"
  }
}