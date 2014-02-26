# Is it the actual householder or the Local Mason who sources the individual parts?
# The supply chain document suggests it's the local mason who talks to the suppliers. Could be wrong!
# Emily's email from their conversation talked about rural customers who need to connect to the small supplier
# Maybe there's another level between the owner of the final latrine and the supplier of the parts?
# I'm going to go with Latrine Builder in the description as it covers both scenarios but I think it's something we should clarify
Feature: SMS Search
  In order to source the parts for a Latrine
  As a Latrine Builder
  I want to search for local suppliers

  Scenario: Successful search
    Given Suppliers for the Latrine Slab product near Bo
    When I SMS a quote for a Latrine Slab near Bo
    Then I should get a list of suppliers near Bo with thier price for a Latrine Slab
