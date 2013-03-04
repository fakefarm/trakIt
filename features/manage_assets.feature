Feature: Managing inventory assets
  In order to manage inventory
  As an admin 
  I want to manage assets

  Scenario: Navigating to new asset page
    Given I am on the home page
     When I follow "New Asset"
     Then I should be on the new asset page

  Scenario: Admin can view assets
    Given a bundle exists with name: "TV"
      And asset exists with name: "MacBook", quantity: 1, bundle_id: 1
      And I am on the home page
      And I follow "Assets"
     When I follow "MacBook"
     Then I should be on the asset page 

  Scenario: Admin can delete an asset
    Given a asset exists with name: "MacBook", quantity: 1, bundle_id: 1
      And a bundle exists with name: "TV"
      And I am on the assets page
     When I follow "Destroy"
     Then I go to the assets page

  Scenario: Admin can edit an asset
    Given a bundle exists with name: "TV"
      And a asset exists with name: "MacBook", quantity: 1, bundle_id: 1
      And I am on the home page
     When I follow "Assets"
      And I follow "Edit"
     Then I go to asset edit page
   
  Scenario: Admin can create a new asset
    Given a bundle exists with name: "TV"
     When I am on the new asset page
      And I select "TV" from "Bundle"
      And I fill in "Name" with "Samsung" 
      And I fill in "Quantity" with "1" 
      And press "Save"
     Then I should see "Samsung"

  Scenario: Admin cannot enter an incomplete asset
    Given a bundle exists with name: "TV"
      And I am on the new asset page
      And I select "TV" from "Bundle"
      And I fill in "Name" with "Samsung" 
      And press "Save"    
     Then I should see "Quantity can't be blank"
