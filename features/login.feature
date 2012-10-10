Feature: Log in
  In order to make a encode, decode operations
  A User
  Should be able to sign in

  Background:
    Given I am signed up as "arufanov/secret"
    And I go to the sign in page

  Scenario: User signs in successfully
    Given I sign in as "arufanov/secret"
    Then I should see "Logged in successfully."
    Then I should be on the my dashboard page
    And I should be logged in

  Scenario: User is not signed up
    Given I sign in as "arufanov/wrong_password"
    Then I should see "Login/Password combination is not valid"
    And I should be logged out

  Scenario: User enters wrong password
    Given I sign in as "arufanov/wrongpassword"
    Then I should see "Login/Password combination is not valid"
    And I should be logged out

  Scenario: User requests a restricted admin page with the correct password
    Given I have an admin account of "rrufanov/secret"
    When I go to the admin page
    And I should be on the new session page
    Then I sign in as "rrufanov/secret"
    And I should see "Logged in successfully."
    And I should be on the admin page

  Scenario: User requests a restricted moderator page with the correct password
    Given I have an moderator account of "vrufanov/secret"
    When I go to the moderator page
    And I should be on the new session page
    Then I sign in as "vrufanov/secret"
    And I should see "Logged in successfully."
    And I should be on the moderator page

  Scenario: User requests a restricted hrmanager page with the correct password
    Given I have an hrmanager account of "krufanova/secret"
    When I go to the hrmanager page
    And I should be on the new session page
    Then I sign in as "krufanova/secret"
    And I should see "Logged in successfully."
    And I should be on the hrmanager page

