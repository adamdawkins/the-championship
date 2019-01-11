When("I click on {string}") do |thing|
  click_on(thing)
end

When("I submit the form") do
  find('input[name="commit"]').click
end

When("I fill in {string} with {string}") do |field, value|
  fill_in field, with: value
end

When("I click on the {string} checkbox") do |label|
  find('label', text: label).click
end
