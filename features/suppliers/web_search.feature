Feature: Web Search
  In order to source the materials for a Latrine
  As a Supplier with a internet connection
  I want to search for local raw materials

  Background:
    Given a location called Bo in Sierra Leone
    And a material named Concrete
    And I'm logged in as a supplier from Bo
    And the following Suppliers for the Concrete material:
      | distance | price |
      |      0km |  $100 |
      |     10km |  $110 |
      |     26km |  $126 |
      |     51km |  $151 |

  Scenario: Successful search
    When I view the Concrete material page
    Then I should see the list of suppliers within 25km of Bo on the page with thier price for Concrete

  Scenario: Wider area search
    When I set my search radius to 50km
    And I view the Concrete material page
    Then I should see the list of suppliers within 50km of Bo on the page with thier price for Concrete
