require 'httparty'
require 'simple-rss'
require 'hpricot'

class Meetup
  attr_accessor :title, :link, :content, :when, :rsvp_count
  
  def initialize(rss_item)
    @title = rss_item.title
    @link = rss_item.link
    doc = Hpricot(rss_item.description)
    @when = Time.parse((doc/"h3").first.html)
    @content = (doc/"p").first.html
  end
  
  def self.upcoming_meetups
    # todo use json, get more attributes
    rss = SimpleRSS.parse HTTParty.get "http://api.meetup.com/events.rss/?group_id=347566&text_format=plain&order=time&key=2cf75979e35663a305614c217a12"
    rss.items.map { |event| Meetup.new(event) }
  end
  
  # todo get this working - render a new page
  # def self.past_meetups
  #   rss = SimpleRSS.parse HTTParty.get "http://api.meetup.com/events.rss/?group_id=347566&text_format=plain&order=time&key=2cf75979e35663a305614c217a12&status=past"
  #   rss.items.map { |event| Meetup.new(event) }
  # end

end
