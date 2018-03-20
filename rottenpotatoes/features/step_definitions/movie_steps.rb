Given(/^the following movies exist:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |movie|
      Movie.create!(movie)
  end
end

Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |arg1, arg2|
  Movie.find_by_title(arg1).director == arg2
end

Then /^the rating of "(.*?)" should be "(.*?)"$/ do |movie_title, new_rating|
  movie = Movie.find_by_title movie_title
  movie.rating.should == new_rating
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
    page.body.should =~ /#{e1}.*#{e2}/m
end

When /I (un)?check the checkbox: (.*)/ do |uncheck, rating_list|
  rating_list.split(',').each do |rating|
    step "I #{uncheck}check \"ratings_#{rating}\""
  end
end