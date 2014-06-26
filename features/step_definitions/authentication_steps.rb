Given /^a user visits the signin page$/ do
	visit signin_path
end
Given /^a user submits changes$/ do
	click_button 'Save'
end
Given /^a user visits the user page$/ do
	visit edit_user_path(@user)
end
When /^they submit invalid signin information$/ do
	click_button "Sign in"
end
Then /^they should see an error message$/ do
	expect(page).to have_selector('div.alert.alert-error')
end
Then /^they should see update content$/ do
	expect(page).to have_content("Update your profile")
end 
Then /^they should see a link to change their avatar$/ do
	expect(page).to have_link('change', href: 'http://gravatar.com/emails')
end
Given /^the user has an account$/ do
	@user = User.create(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation:"foobar")
end
Given /^the user submits valid signin information$/ do
	fill_in "Email", with: @user.email
	fill_in "Password", with: @user.password
	click_button "Sign in"
end
Then /^they see their name as the title$/ do
	expect(page).to have_title(@user.name)
end
Then /^they should see a profile link$/ do
	expect(page).to have_link('Profile', href: user_path(@user))
end
Then /^they should see a settings link$/ do
	expect(page).to have_link('Settings', href: edit_user_path(@user))
end
Then /^they should not see a signin link$/ do
	expect(page).to_not have_link('Sign in', href: signin_path)
end
Then /^they should see a signout link$/ do
	expect(page).to have_link('Sign out', href: signout_path)
end