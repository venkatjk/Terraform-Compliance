Feature: DEMO S3 Standards
  Scenario: Enforce s3 encryption
    Given I have aws_s3_bucket defined
    Then it must contain server_side_encryption_configuration

  Scenario: Enforce s3 versioning
    Given I have aws_s3_bucket defined
    Then it must contain versioning
