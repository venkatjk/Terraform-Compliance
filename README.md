## Terraform-Compliance
Automated testing of TF deployments

## Installation
Terraform-Compliance can be installed with both Docker and Pip which are both supported by the platform.

## Usage
Terraform-Compliance is an executable which requires two parameters to be passed. That being the -f/file and the -p/plan.

1. The file which is used can either be a local folder directory or a git repo. One of the interesting things with these options is it allows us to use this tool for different purposes. We can use it as part of our automated run to check the repo before we download it, or to do it against the repo after it was downloaded should we need to do any mutations against the files. Furthermore we could also have a set list of repos in our organization and have this run against them as a scheduled run.<br>
2. The plan which is used can either be the output of a Terraform Plan command or a State file. This state file could be in S3, which allows us to both check against what we want to deploy and what is already deployed.<br>
3. There are other useful parameters which can be passed. I would recommend using it with -s for silent for readability.<br>

Terraform Compliance uses the Radish scripting language: http://radish-bdd.io/

Tests are written in Radish in a Behaviour Driven Development fashion. For more information on the syntax please visit this link: https://terraform-compliance.com/pages/bdd-references/

These tests are assertions upon resources. They use a combination of Given, When, Then, and And. As some examples:

Given I have a DynamoDB Table Then It should have backup = true 

Radish in this case is quite a straightforward syntax and makes sense in a readable way. Here is another example which refers to the Terraform syntax (above) for the resource rather than Radish syntax (below).
```console
Feature: My test feature

Scenario: Ensure my specific s3 buckets are private
  Given I have aws_s3_bucket defined
  Then it must contain acl
  And its value must be private
Feature: My test feature


Scenario: Ensure my specific s3 buckets are private
  Given I have AWS S3 Bucket defined
  Then it must contain acl
  And its value must be private
```  

## TerraTest
https://github.com/gruntwork-io/terratest

Installation
TerraTest is a Go project which needs to be compiled and ran like other Go programmes. As such we will need to create our own Go project and then step into the go.build directory and run the tests as a package from there.

Usage
As mentioned above TerraTest is a Go Project. Therefore we would need to create our tests in golang programming language. These tests then allows us to create our Infrastructure, run the tests as a package against that deployed Infrastructure, and then bring it back down. It would work quite well as a full end-to-end testing framework for our code.

Evaluation
I believe that TerraTest is quite bulky in comparison to Terraform-Compliance. Moreover bringing up Infrastructure to run tests against could be quite pricey given the size of our Infrastructure. Not to mention that as it is golang based it would require knowledge of Go to be able to write the test cases for this. 

TerraTests test cases it gives as part of the example documentation seems to be http get requests, curls, sshing to servers, and other health-checks like that. I believe we could do a similar thing with the command-line anyway. I don't feel the difference between the two is large enough to warrant using the additional helper functions.

Comparison
Terraform-compliance seems to be a user friendly and straightforward option to test our code against. It can be used for different testing functionality and is lightweight.
