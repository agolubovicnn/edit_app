
Given(/^I am not logged in$/) do
  current_driver = Capybara.current_driver
end

When(/^I am on the home page$/) do
  visit root_path
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content(text)
end

Then(/^I should see "(.*?)" link$/) do |link_text|
  page.should have_content(link_text)
end

Given(/^I am logged in as user$/) do
	User.create!(email: "user@email.com", password: "asdasdasd")
end

When(/^I try to sign up$/) do
  visit root_path
end

When(/^I push sign up link$/) do
 click_link('Sign up')
end

When(/^I enter my "(.*?)", "(.*?)", "(.*?)" and "(.*?)"$/) do |username, email, password,
 password_confirmation|
 fill_in('Username', :with => 'Example')
 fill_in('Email', :with => 'example@example.org')
 fill_in('Password', :with => 'example')
 fill_in('Password confirmation', :with => 'example')
end

When(/^I push sign up button$/) do
 click_button('Sign up')
end

Then(/^I am log in as user$/) do
 page.should have_content("Welcome! You have signed up successfully")
end
