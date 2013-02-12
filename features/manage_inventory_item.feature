Feature: Managing inventory items
  In order to manage inventory
  As an admin 
  I want to create a new items

  Scenario: Navigating to new item page
    Given I am on the home page
    When I click 'New item'
    Then I should be directed to 'New item' page



  # Scenario: User doesnt fill out form properly
  #   Given I am on checkout page
  #   When I dont add a quantity
  #   Then I should see a "please enter qty"