require 'rubygems'
require 'test/unit'
require 'httparty'
require 'hashie'
require 'json'
require 'models/meetup'
require 'yaml'

class BmoreTest < Test::Unit::TestCase
  # update the test data first: Meetup.update_test_data
  def test_fetch_upcoming_events
    test_response_string = JSON.dump(YAML.load_file('test/fixtures/upcoming_meetups.yml'))
    assert_equal ["16332252", "16829624", "16829687"], Meetup.upcoming_meetups(test_response_string).map{|m| m['id']}
  end
  
  def test_fetch_rsvps_by_event_id
    assert_equal [{:name => 'Ed Schmalzle'}, {:name => 'George Anderson'}, {:name => 'Jack Waugh'}, {:name => 'Shawn Dellysse'}], Meetup.rsvps_by_event_id('16332252')
  end
end