Given /^I visit the upload page\.$/ do
  visit '/uploads/new'
end

Given /^I upload the fixed files "(.*?)" and "(.*?)"$/ do |file1, file2|
  attach_file('Files', [file1, file2].map{|p| "features/fixtures/files/#{p}"})
  click_button "Submit"
end



Then /^I see the content "(.*?)"$/ do |content|
  page.should have_content(content)
end

