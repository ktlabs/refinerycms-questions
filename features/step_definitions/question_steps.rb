Given /^I have no questions$/ do
  Question.delete_all
end

Then /^I should have ([0-9]+) questions?$/ do |count|
  Question.count.should == count.to_i
end

Given /^I have an? question from "([^"]*)" with email "([^\"]*)" and message "([^\"]*)"$/ do |name, email, message|
  Question.create(:name => name,
                 :email => email,
                 :message => message)
end

Given /^I have an? question titled "([^"]*)"$/ do |title|
  Question.create(:name => title,
                 :email => 'test@cukes.com',
                 :message => 'cuking ...',
                 :spam => false)

  Question.create(:name => title,
                 :email => 'test@cukes.com',
                 :message => 'cuking ...',
                 :spam => true)
end
