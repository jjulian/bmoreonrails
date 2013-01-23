require 'httparty'
require 'hashie'
require 'json'

# See http://www.meetup.com/meetup_api/docs/2/events/
class Meetup
  include HTTParty
  default_params :key => '2cf75979e35663a305614c217a12', :group_id => '347566'

  def self.upcoming_meetups
    JSON.parse(get("http://api.meetup.com/2/events?text_format=plain&status=upcoming&order=time&desc=false&offset=0&format=json&page=3").body, :object_class => Hashie::Mash).results
  end

  def self.past_meetups
    JSON.parse(get("http://api.meetup.com/2/events?text_format=plain&status=past&order=time&desc=true&offset=0&format=json&page=100").body, :object_class => Hashie::Mash).results
  end
end
