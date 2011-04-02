require 'rubygems'
require 'test/unit'
require 'httparty'
require 'hashie'
require 'json'
require 'models/meetup'
require 'yaml'

class BmoreTest < Test::Unit::TestCase
  # update the test data first
  def test_fetch_upcoming_event_ids
    test_response_string = JSON.dump(YAML.load_file('test/fixtures/upcoming_meetups.yml'))
    assert_equal ["16332252", "16829624", "16829687"], Meetup.upcoming_meetup_ids(test_response_string)
  end
  
  def test_fetch_rsvps_by_event_id
    assert_equal ['Ed Schmalzle', 'George Anderson', 'Jack Waugh', 'Shawn Dellysse'], Meetup.rsvps_by_event_id('16332252')
  end
end