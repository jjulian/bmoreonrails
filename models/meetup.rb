require 'httparty'
require 'hashie'
require 'json'

class Meetup
  include HTTParty
  default_params :key => '2cf75979e35663a305614c217a12', :group_id => '347566'
  
  def self.upcoming_meetups
    JSON.parse(get("http://api.meetup.com/events.json/?text_format=plain&order=time&page=3").body, :object_class => Hashie::Mash).results
  end
  
  # todo get this working - render a new page
  # def self.past_meetups
  #   JSON.parse(get("http://api.meetup.com/events.json/?text_format=plain&order=time&page=12&status=past").body, :object_class => Hashie::Mash).results
  # end

end
