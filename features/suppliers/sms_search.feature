Feature: Web Search
  In order to source the materials for a Latrine
  As a Supplier with no internet connection
  I want to search for local raw materials

  Background:
    Given a location called Bo in Sierra Leone
    And a material named Concrete
    And the following Suppliers for the Concrete material:
      | distance | price |
      |      0km |  $100 |
      |     10km |  $110 |
      |     26km |  $126 |
      |     51km |  $151 |

  Scenario: Getting list of materials
    When I SMS a material list request for Bo
    Then I should receive a SMS containing the Concrete material

  Scenario: Successful product search
    When I SMS a quote for Concrete near Bo
    Then I should receive a SMS containing a list of suppliers with 25km of Bo with thier price for Concrete

  Scenario: Wider are search
    When I SMS a quote for Concrete within 50km of Bo
    Then I should receive a SMS containing a list of suppliers within 50km of Bo with thier price for Concrete
