require 'httparty'
require 'hashie'
require 'json'

class Member
  include HTTParty
  default_params :key => '2cf75979e35663a305614c217a12', :group_id => '347566'

  def self.all
    # the meetup api returns a max of 200 at a time...since we have 273 members (5/2010) get the first 2 pages
    # [0,1].inject([]) do |records,offset|
    #   records.concat JSON.parse(get("http://api.meetup.com/members.json/?offset=#{offset}").body, :object_class => Hashie::Mash).results
    # end
    [Hashie::Mash.new(:name => 'Ed Schmalzle'), Hashie::Mash.new(:name => 'George Anderson'), Hashie::Mash.new(:name => 'Jack Waugh'), Hashie::Mash.new(:name => 'Shawn Dellysse')]
  end
  
  def self.list
    [
      ['Jonathan Julian','jjulian','jonathanjulian','http://gravatar.com/avatar/519e2fdbde9ac0662f8c82438e3b4d6c?s=60'],
      ['Ed Schmalzle','nerdEd','nerded','http://gravatar.com/avatar/b999889fbbc0930155ca5939423302a9?s=60'],
      ['Chris Strom','eee-c','eee_c','http://gravatar.com/avatar/14dbf7a599c130c2a0c6d29cbd83f275?s=60'],
      ['Paul Barry','pjb3','pjb3','http://gravatar.com/avatar/6661ef9d747db3af8896cd94959d717d?s=60'],
      ['Vincent Agnello','agnellvj','agnellvj','https://si2.twimg.com/profile_images/743826812/lastGreenbelt-500x333_reasonably_small.jpg'],
      ['Nick Gauthier','ngauthier','ngauthier','http://gravatar.com/avatar/7855932fef545822ef0f5e049e6e2d46?s=60'],
      ['John Trupiano','jtrupiano','jtrupiano','http://gravatar.com/avatar/63d809dbf4d44297f73caad307972ec5?s=60'],
      ['Sinclair Bain','sinclair','sinclairbain','http://gravatar.com/avatar/c3a0d4a0b1c4854636c18d940ec49814?s=60'],
      ['Scott Messinger','scottmessinger','scottmessinger','http://gravatar.com/avatar/05d674b2b03b5d47c9780fd090aecbfb?s=60'],
      ['George Anderson','george','benevolentcode','http://gravatar.com/avatar/ebc1e0dfecc4345887f07239f102ad3e?s=60'],
      ['Andy Atkinson','webandy','webandy','http://gravatar.com/avatar/20da32dbe6aba0a135024ac4a816a200?s=60'],
      ['Nicholas A. Evans','nevans','nick_evans','http://gravatar.com/avatar/dfaba90dcff3238dc9770e270232b4a1?s=60'],
      ['Bryan Liles','bryanl','bryanl','http://gravatar.com/avatar/ba4b0b302231bffb0f685bbef25db0d6?s=60'],
      ['Matt Scilipoti','mattscilipoti','mattscilipoti','http://gravatar.com/avatar/24a6d691246b3d431a9a143fdad483a3?s=60'],
      ['Mike Subelsky','subelsky','subelsky','http://gravatar.com/avatar/f7d969d7a72376fab89cba3554c18ec1?s=60'],
      ['Chris Cahoon','ccahoon','cahooon','http://gravatar.com/avatar/0cbd59255fc17f956fa9346898f86adb?s=60']
    ].map { |a| Hashie::Mash.new(:name => a[0], :github_name => a[1], :twitter => a[2], :avatar_url => a[3]) }
  end
  
  def self.railsconf_2011_speakers
    [
      ['Jonathan Julian','http://gravatar.com/avatar/519e2fdbde9ac0662f8c82438e3b4d6c?s=53','Enough Design to be Dangerous','http://en.oreilly.com/rails2011/public/schedule/detail/19522'],
      ['Avdi Grimm','http://gravatar.com/avatar/1968aedf598d1a7760db5ab306b5f153?s=53','Confident Code','http://en.oreilly.com/rails2011/public/schedule/detail/18418'],
      ['Bryan Liles','http://gravatar.com/avatar/ba4b0b302231bffb0f685bbef25db0d6?s=53','ActiveSupport 3: What We Should Know About What We Don\'t Know','http://en.oreilly.com/rails2011/public/schedule/detail/19431'],
      ['Greg Gershman','http://1.gravatar.com/avatar/b8e642733bfbb0417b3076ffebe5a080?s=36&d=identicon&r=R','Enhancing the Search Box','http://en.oreilly.com/rails2011/public/schedule/detail/19447'],
      ['Nick Gauthier','http://gravatar.com/avatar/7855932fef545822ef0f5e049e6e2d46?s=53','KnowSQL: Database Tricks to Make Your Life Easier','http://en.oreilly.com/rails2011/public/schedule/detail/18476'],
      ['David Troy','http://www.gravatar.com/avatar/ab03191a5efe5343a0517bf5e4fbdaf2.png?s=53','Stateful, Scalable Servers With EventMachine and Rails','http://en.oreilly.com/rails2011/public/schedule/detail/19674'],
      ['Mike Subelsky','http://gravatar.com/avatar/f7d969d7a72376fab89cba3554c18ec1?s=53','Building Web Apps With HTML5','http://en.oreilly.com/rails2011/public/schedule/detail/18321']
    ].map { |a| Hashie::Mash.new(:name => a[0], :avatar_url => a[1], :presentation_name => a[2], :presentation_url => a[3]) }
  end
end
