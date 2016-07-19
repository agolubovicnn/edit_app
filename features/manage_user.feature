Feature: Manage Users
  In order to make a Editor application
  I want to sign in

Scenario: Login fails with invalid parameters
  Given I am not logged in
  When I am on the home page
  Then I should see "Sign up" link
  And I should see "Login" link

Scenario: Crating Valid Profile
  Given I am logged in as user
  When I try to sign up
  And I push sign up link
  And I enter my "username", "email", "password" and "password_confirmation"
  And I push sign up button
  Then I am log in as user
