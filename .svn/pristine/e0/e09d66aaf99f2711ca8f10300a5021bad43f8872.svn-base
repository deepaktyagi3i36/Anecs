Feature: Log out
  In order to remove web session from the browser
  A User
  Should be able to sign out

  Scenario: User is signed in
    Given I am signed up as "arufanov/secret"
    When I go to the sign in page
    And I sign in as "arufanov/secret"
    And I follow "Logout"
    Then I should be logged out