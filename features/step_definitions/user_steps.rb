Given(/^I am on the home page$/) do
  visit root_path
end

When(/^I click "Sign up now" button$/) do
  click_on "Sign up now!"
end

Then(/^I should see "Welcome, Sign Up to start your Edit App!$/) do
  expect(page).to have_content("You need to sign in or sign up before continuing")
end

Then(/^I fill "(.*?)" as User name$/) do |user_name|
  fill_in "User name", :with => user_name
end

Then(/^I fill "(.*?)" as Email$/) do |email|
  fill_in "Email", :with => email
end

Then(/^I fill "(.*?)" as Password$/) do |password|
  fill_in "Password", :with => password
end

Then(/^I fill "(.*?)" as Password confirmation$/) do |password_confirmation|
  fill_in "Password confirmation", :with => password_confirmation
end

Then(/^I click "Sign up" button$/) do
  click_on "Sign up"
end

Then(/^I should see "Welcome! You have signed up successfully."$/) do
  expect(page).to have_content("Welcome! You have signed up successfully.")
end
