output origin_request_lambda_arn {
  value = "${aws_lambda_function.origin_request.qualified_arn}"
}

output basic_auth_lambda_arn {
  value = "${aws_lambda_function.basic_auth.qualified_arn}"
}

output cookie_plant_lambda_arn {
  value = "${aws_lambda_function.cookie_plant.qualified_arn}"
}

