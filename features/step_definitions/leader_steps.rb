Given("a leader has an account with email {string} and password {string}") do |email, password|
  Leader.create(email: email, password: password)
end
