Feature: Supplier Signup
  In order to make my details available for searching
  As a Supplier
  I want to register on the site

  Background:
    Given a location called Bo in Sierra Leone
    And a product named Latrine Slab

  Scenario: Successful Registration
    When I signup as a supplier in Bo
    Then I should see the list of products
