Feature: Signing in
	Scenario: Unsuccessful signin
		Given a user visits the signin page
		When they submit invalid signin information 
		Then they should see an error message
	Scenario: Successful signin
		Given a user visits the signin page
			And the user has an account
		When the user submits valid signin information
		Then they see their name as the title
			And they should see a profile link
			And they should see a settings link
			And they should not see a signin link
			And they should see a signout link
