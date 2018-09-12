Given("I am an unlogged user") do
  # Nothing to do :)
end

Given("I am a logged user with {string} as a name") do |name|
  user = create(:user, name:name, password: 'abc1234')
  visit '/users/sign_in'
  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: 'abc1234'
  click_on 'Log in'
end
