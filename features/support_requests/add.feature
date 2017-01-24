Feature: Add Support Request
  As a customer I want to create a support request

  Scenario: Customer creates support request
    Given I'm logged in as a customer
    When I create support request
    Then response is 204 No Content

  Scenario: The params is invalid
    Given I'm logged in as a customer
    When I create support request with invalid params
    Then I get 422 error
