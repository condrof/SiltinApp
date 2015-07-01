Feature: Web Search
  In order to source the parts for a Latrine
  As a Latrine Builder with a internet connection
  I want to search for local suppliers

  Background:
    Given a location called Bo in Sierra Leone
    And a product named Latrine Slab
    And the following Suppliers for the Latrine Slab product:
      | distance | price |
      |      0km |  $100 |
      |     10km |  $110 |
      |     26km |  $126 |
      |     51km |  $151 |

  Scenario: Successful search
    When I set my location to Bo
    And I view the Latrine Slab product page
    Then I should see the list of suppliers within 25km of Bo on the page with thier price for a Latrine Slab

  Scenario: Wider area search
    When I set my location to Bo
    And I set my search radius to 50km
    And I view the Latrine Slab product page
    Then I should see the list of suppliers within 50km of Bo on the page with thier price for a Latrine Slab
