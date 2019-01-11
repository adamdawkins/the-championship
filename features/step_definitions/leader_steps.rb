Given("a leader has an account with email {string} and password {string}") do |email, password|
  Leader.create(email: email, password: password)
end

Given("I am logged in as a leader") do
  @me ||= FactoryBot.create(:leader, email: 'adam@dragondrop.uk', password: 'password')
  @my_password ||= 'password'
  visit new_leader_session_path
  steps  %{
    When I fill in my leader account details
    And I submit the form
  }
end

When("I fill in my leader account details") do
  fill_in "leader[email]", with: @me.email
  fill_in "leader[password]", with: @me.password
end

# Routes

When("I go the new contestant page") do
  visit new_admin_contestant_path
end
