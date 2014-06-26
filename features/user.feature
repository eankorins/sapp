Feature: User
	Scenario: Edit
		Given a user visits the signin page
			And the user has an account
		Then they should see update content
			And they see their name as the title
			And they should see a link to change their avatar
			
	Scenario: Invalid information
		Given a user submits changes
		Then they should see an error message
