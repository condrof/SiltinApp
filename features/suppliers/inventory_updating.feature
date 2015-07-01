Feature: Supplier updating inventory
  In order to appear on search results for products I have in stock
  As a Supplier
  I want to be able to update my inventory

  Background:
    Given a location called Bo in Sierra Leone
    And a product named Latrine Slab
    And I'm logged in as a supplier from Bo

  Scenario: Supplier has inventory of product
    When I update my inventory for Latrine Slab to 1
    And I update my price for Latrine Slab to $10
    Then I appear in the search results for Latrine Slab near Bo with price $10

  Scenario: Supplier does not have inventory of product
    When I update the inventory for Latrine Slab to 0
    Then I do not appear in the search results for Latrine Slab near Bo
