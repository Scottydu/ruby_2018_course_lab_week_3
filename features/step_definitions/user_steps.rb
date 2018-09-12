Given("with a created user called {string}") do |name|
  create(:user, name: name)
end

Given("I am in the homepage") do
  visit root_url
end

When("I click on the {string} profile button") do |name|
  click_on name
  # find('h4', text: name).click
end

Then("I should see {string} details with {int} friends") do |name, friends_number|
  expect(page).to have_content(name)
  expect(page).to have_content("Friends (#{friends_number} friends)")
end

When("I click on {string}") do |string|
  click_on string
end

Then("I should see {string} in the friends list") do |name|
  expect(page.find('.friends-container')).to have_content(name)
end

Then("{string} should be a friend of {string}") do |name, name2|
  user1 = User.find_by(name: name)
  user2 = User.find_by(name: name2)
  expect(user1.friends).to include(user2)
end
