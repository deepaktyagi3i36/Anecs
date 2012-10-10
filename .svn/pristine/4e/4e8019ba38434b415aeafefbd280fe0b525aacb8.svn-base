Feature: Sign up
  In order to be able to make a encode, decode operations
  A visitor
  Should be able to sign up

  Scenario: User signs up with invalid data
     When I go to the sign up page
     And I fill in "Email" with "invalid email"
     And I fill in "Password" with "password"
     And I fill in "Password Confirmation" with ""
     And I press "Sign up"
     Then I should see error messages

  Scenario: User signs up with valid data
    When I go to the sign up page
    And I fill in "Login" with "arufanov"
    And I fill in "Email" with "arufanov@example.com"
    And I fill in "Password" with "secret"
    And I fill in "Password Confirmation" with "secret"
    And I fill in "Nickname" with "arufanov"
    And I fill in "First Name" with "arufanov"
    And I fill in "Middle Name" with "arufanov"
    And I fill in "Last Name" with "arufanov"
    And I press "Sign up"
    Then I should see "Thanks for signing up! Activation letter has been sent."
