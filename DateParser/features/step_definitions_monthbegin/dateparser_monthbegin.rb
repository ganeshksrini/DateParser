require 'rubygems'
require 'bundler/setup'
require 'watir'
require 'cucumber'
require 'test/unit'
require 'minitest'
require 'date'
require 'time'
extend Test::Unit::Assertions
#extend Minitest::Assertions
#extend Test::Unit::TestCase
browser = Watir::Browser.new :chrome

Given(/^user goes to website$/) do
  browser.goto("https://vast-dawn-73245.herokuapp.com/")
end

When(/^enter (.*) as beginning specific format on the input field and submit$/) do |mdate|
  tm = browser.text_field(:name => "date").set "#{mdate}"
  browser.send_keys :return
end

Then(/^I see correct (.*) on the form$/) do |mdate|
  ##query2 = DateTime.parse(query).strftime("%a %b %d %Y 00:00:00 GMT+0000")
  #puts "parsing output is #{mdate}"
  mdate =~ %r"\b\d{1,2}([-/ ])\d{1,2}\1\d{2,4}\b"
  case mdate.scan(%r"[-/ ]").first
  when "/" then
    mdate1 = Date.strptime(mdate,"%m/%d/%y").strftime("%a %b %d %Y 00:00:00 GMT+0000")
  when "-" then
    mdate1 = Date.strptime(mdate,"%m-%d-%y").strftime("%a %b %d %Y 00:00:00 GMT+0000")
  when " " then
    mdate1 = Date.strptime(mdate,"%m %d %y").strftime("%a %b %d %Y 00:00:00 GMT+0000")
  end
  #mdate1 = Date.strptime(mdate,"%m-%d-%Y").strftime("%a %b %d %Y 00:00:00 GMT+0000")
  #puts "parsing output1 is #{mdate1}"
  ##mdate2 = DateTime.parse(mdate1).strftime("%a %b %d %Y 00:00:00 GMT+0000")
  browser.div(:class => "col-md-6").wait_until(&:present?)
  page_output2 = browser.div(:class => "col-md-6", :index => 1).text
  page_output = browser.div(:class => "col-md-6", :index => 1).text.include?"#{mdate1}"
  if (page_output == true)
    puts "Results are matched for Input date #{mdate} output date #{page_output2} Pass"
  else
    puts "Results are not matched for Input date #{mdate} output date #{page_output2} Fail"
    ##@browser.close
  end
end