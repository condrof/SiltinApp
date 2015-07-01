Feature: SMS Search
  In order to source the parts for a Latrine
  As a Latrine Builder with no internet connection
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

  Scenario: Getting list of products
    When I SMS a product list request for Bo
    Then I should receive a SMS containing the Latrine Slab product

  Scenario: Successful search
    When I SMS a quote for a Latrine Slab near Bo
    Then I should receive a SMS containing a list of suppliers within 25km of Bo with thier price for a Latrine Slab

  Scenario: Wider area search
    When I SMS a quote for a Latrine Slab within 50km of Bo
    Then I should receive a SMS containing a list of suppliers within 50km of Bo with thier price for a Latrine Slab
