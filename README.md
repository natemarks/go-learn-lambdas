
Trying to figure out what makes s good lambda deployment


## Experiment Goals: This would be cool if...

- Safely use external public libraries
  - node, python, Go
- fast, easy local testing
- automated integration testing (TF build, test, teardown)
- Implement security best practices
- Check out tracing
- External services
  - MySQL,  ongo, etc.
  - SSO OAuth2 (See above)
  - Node/npm

## Initial Outcomes/story ideas
- Deploy a single node entity with REST CRUD API
  - Swagger documentation
  - MySQL persistence
  - React default front end
  - Semver with build number

## Discussion topics
- URLs and namespaces
- Inter lambda calls/messaging

## TODO
~~First I need  a lambda to poke at.  Copy the AWS go-blank example~~

~~Script deployment and teardown  using Terraform~~

Document manual testing tracing debugging
Figure out how to do  local testing/debugging

Then figure out how to test it locally
Then use cloudwatch logging

## Reference

[Learn about step function state machine](https://docs.aws.amazon.com/step-functions/latest/dg/tutorial-creating-lambda-state-machine.html)

[Best tools for serverless observability](https://www.serverless.com/blog/best-tools-serverless-observability)

[AWS blank-go: A sample Go lambda project](https://github.com/awsdocs/aws-lambda-developer-guide/tree/main/sample-apps/blank-go)

[go /lambda/terraform example](https://dev.to/esenac/deploy-an-aws-lambda-function-in-go-with-terraform-12ap)

[Testing Lambdas Locally](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-using-debugging.html)


[AWS Lambda Security Best Practices](https://docs.aws.amazon.com/whitepapers/latest/serverless-architectures-lambda/security-best-practices.html)

[Lambda Tracing](https://docs.aws.amazon.com/lambda/latest/dg/services-xray.html)

[A good tracing article](https://www.infoq.com/articles/tracing-aws-lambda-functions/)

[AWS services that can trigger lambdas](https://docs.aws.amazon.com/lambda/latest/dg/lambda-services.html)
