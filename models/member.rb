require 'httparty'
require 'hashie'
require 'json'

class Member
  include HTTParty
  default_params :key => '2cf75979e35663a305614c217a12', :group_id => '347566'

  def self.all
    # the meetup api returns a max of 200 at a time...since we have 273 members (5/2010) get the first 2 pages
    [0,1].inject([]) do |records,offset|
      records.concat JSON.parse(get("http://api.meetup.com/members.json/?offset=#{offset}").body, :object_class => Hashie::Mash).results
    end
  end
end
