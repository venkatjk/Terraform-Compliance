Feature: DEMO Blocked Resources	
  Scenario Outline: Restrict creation of specific resources	
    Given I have <resource> defined	
    Then the scenario should fail	

  Examples:	
    | resource        |	
    | aws_iam_user    |
