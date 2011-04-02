require 'httparty'
require 'hashie'
require 'json'

class Meetup
  include HTTParty
  default_params :key => '2cf75979e35663a305614c217a12', :group_id => '347566'
  
  def self.update_test_data
    File.open(File.join("test", "fixtures", "upcoming_meetups.yml"), 'w') do |file|
      json_string = JSON.parse(get("http://api.meetup.com/events.json/?text_format=plain&order=time&page=3").body)
      file.write json_string.to_yaml
    end
  end
  
  def self.upcoming_meetups
    JSON.parse(get("http://api.meetup.com/events.json/?text_format=plain&order=time&page=3").body, :object_class => Hashie::Mash).results
  end
  
  def self.upcoming_meetup_ids(test_response_string=nil)
    if test_response_string
      JSON.parse(test_response_string)['results'].map{|meetup| meetup["id"]}
    else
      JSON.parse(get("http://api.meetup.com/events.json/?text_format=plain&order=time&page=3").body, :object_class => Hashie::Mash).results.map(&:id)
    end
  end
  
  def self.rsvps_by_event_id(event_id)
    JSON.parse(get("http://api.meetup.com/rsvps.json/?event_id=#{event_id}").body)['results'].inject([]) {|result, element| 
      result << {:name => element['name']}
      result
    }
  end
  
  def self.past_meetups
    # this returns 25 max...wtf -12 works, -13 works, -18 returns less
    JSON.parse(get("http://api.meetup.com/events.json/?text_format=plain&order=time&status=past&after=-12m&before=0d&order=time&desc=true").body, :object_class => Hashie::Mash).results
  end

end
