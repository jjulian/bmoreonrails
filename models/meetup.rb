require 'httparty'
require 'hashie'
require 'json'

class Meetup
  include HTTParty
  default_params :key => '2cf75979e35663a305614c217a12', :group_id => '347566'
  
  def self.upcoming_meetups
    JSON.parse(get("http://api.meetup.com/events.json/?text_format=plain&order=time&page=3").body, :object_class => Hashie::Mash).results
  end
  
  def self.past_meetups
    # this returns 25 max...wtf -12 works, -13 works, -18 returns less
    JSON.parse(get("http://api.meetup.com/events.json/?text_format=plain&order=time&status=past&after=-12m&before=0d&order=time&desc=true").body, :object_class => Hashie::Mash).results
  end

end
