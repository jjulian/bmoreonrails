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
    # c = (doc/"p")[1] #the 2nd <p> is the write-up
    # c.search('a').remove
    # @content = c.inner_html
    # @when = (doc/"p")[3].inner_html #the 4th <p> is the date and time
    # @rsvp_count = (doc/"p")[4].inner_html.match(/^Attending: (\d)$/)[1].to_i
  end
  
  def self.upcoming_meetups
    # rss = SimpleRSS.parse HTTParty.get "http://www.meetup.com/bmore-on-rails/calendar/rss/B'more+on+Rails/"
    rss = SimpleRSS.parse HTTParty.get "http://api.meetup.com/events.rss/?group_urlname=bmore-on-rails&text_format=plain&order=time&key=2cf75979e35663a305614c217a12"
    rss.items.map { |event| Meetup.new(event) }
  end
  
end
