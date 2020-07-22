Feature: DEMO Resource Naming Standards
  Scenario Outline: Naming Standard on vpc resources
    Given I have aws_vpc defined
    When it contains name
    Then its value must match the "vpc-(noc|dev|noc|pre|prd).*" regex

  Scenario Outline: Naming Standard on subnet resources
    Given I have aws_subnet defined
    When it contains name
    Then its value must match the "sb-(noc|dev|noc|pre|prd)-(aza|azb)-(pub|ext|trs|res)-0(01|11|03|13|05|15|07|17).*" regex

  Scenario Outline: Naming Standard on route table resources
    Given I have aws_route_table defined
    When it contains name
    Then its value must match the "rt-(noc|dev|noc|pre|prd)-(aza|azb)-(pub|ext|trs|res)0(01|11|03|13|05|15|07|17).*" regex

