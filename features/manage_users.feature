Feature:  Manage users
  In order to manage factory employees
  As an admin
  I want to manage users

  Scenario: Admin can view users
    Given I am on the home page
     When I follow "Users"
     Then I should see "Peeps"

  Scenario: Admin can edit users
    Given a user exists with name: "don.mattingly"
    Given I am on the users page
     When I follow "Edit"
     Then I should see "Editing user"

  Scenario: Admin can delete users
    Given a user exists with name: "don.mattingly"
    Given I am on the users page
     When I follow "Destroy"
     Then I go to the users page

  Scenario: Admin can create new users
      Given I am on the new user page
       When I fill in "Name" with "Tony"
        And press "Save"
       Then I should see "Tony"

  Scenario: Admin can view a user profile
      Given a user exists with name: "don.mattingly"
      Given I am on the users page 
       When I follow "don.mattingly"
       Then I should see "don.mattingly"
  
  