require 'benchmark'
require 'haml'
require 'models/meetup'
require 'models/member'

def render_page(name, hash = {})
  template = File.read("views/#{name}.haml")
  haml_engine = Haml::Engine.new(template)
  output = haml_engine.render(Object.new, hash)
  File.open("public/#{name}.html", 'w') {|f| f.write(output) }
end

desc "Generate the html files from the /view templates into /public"
task :generate do
  time = Benchmark.realtime {
    render_page('index', :meetups => Meetup.upcoming_meetups)
    render_page('past_meetups', :meetups => Meetup.past_meetups)
    render_page('railsconf')
    render_page('praise', :tweets => praise_tweets)
    # render_page('members', :members => Member.all)
  }
  puts "Generated site in #{time} seconds."
end

desc "Remove generated files"
task :clean do
  ['index','past_meetups','railsconf','praise'].each do |f|
    FileUtils.rm "public/#{f}.html", :force => true
  end
  puts "Generated files removed."
end

task :default => :generate

def praise_tweets
  [
    { :text => "The Baltimore Rubyists were an amazing host for #railsconf this year.", :url => "http://twitter.com/MilesForrest/status/15946652933", :user => "MilesForrest" },
    { :text => "Baltimore is a seriously good time. Two nights in a row, absolute gold. #RailsConf", :url => "http://twitter.com/briandoll/status/15763850159", :user => "briandoll" },
    { :text => "Mad props to all the Baltimore Rails @bmoreonrails people. @nerded and so many other were the most hospitable of hosts.", :url => "http://twitter.com/alkema/statuses/15904921391", :user => "alkema" },
    { :text => "Thank you very much to all of the speakers, attendees, and especially staff at #RailsConf. Not to mention the amazing Baltimore locals!", :url => "http://twitter.com/deadprogram/status/15947172999", :user => "deadprogram" },
    { :text => "Especially the @bmoreonrails crew, those guys were amazing hosts.", :url => "http://twitter.com/dcian/statuses/15947328045", :user => "dcian" },
    { :text => "Leaving Baltimore & the best #railsconf yet. Always a blast, one of my fav conferences each year.", :url => "http://twitter.com/neal4d/statuses/15946236895", :user => "neal4d" },
    { :text => "Verdict from everyone I met and heard from at RailsConf was that they absolutely loved it. You should come next year.", :url => "http://twitter.com/dhh/statuses/15908137757", :user => "dhh" },
    { :text => "Ok, #bohconf at #railsconf is officially my favorite conference ever. Summary of today: http://is.gd/cHPKR", :url => "http://twitter.com/seacreature/status/15739327661", :user => "seacreature" },
    { :text => "@jtrupiano Yeah, if Portland could have #railsconf two years in a row, I think Baltimore deserves it two years in a row as well.", :url => "http://twitter.com/luigimontanez/statuses/15944933927", :user => "luigimontanez" },
    { :text => "Yes, Baltimore has a nicer side. #railsconf", :url => "http://twitter.com/jonmagic/statuses/15834608646", :user => "jonmagic" }

    # { :text => "Had an amazing time at #RailsConf and Baltimore in general. Great to see everyone kicking ass!", :url => "http://twitter.com/briandoll/status/15869423931", :user => "briandoll" },
    # { :text => "Goodbye #railsconf, had a great time. Best railsconf of the last three IMO. Props to @bmoreonrails for a great unconf too!", :url => "http://twitter.com/chriseppstein/statuses/15869329353", :user => "chriseppstein" },
    # { :text => "#RailsConf was awesome! Thanks to everybody who was there for a great time! Especially @bmoreonrails! Last week rocked!", :url => "http://twitter.com/iain_nl/statuses/15878864258", :user => "iain_nl" },
    # { :text => "@jonathanjulian hell yes! Thanks so much. You all are awesome!", :url => "http://twitter.com/chadfowler/statuses/15975758365", :user => "chadfowler" },
    # { :text => "Baltimore is a cool place, I'm glad #railsconf gave me an opportunity to visit it. Big ups to LP Steamers", :url => "http://twitter.com/kalinh/statuses/15966577997", :user => "kalinh" },
  ]
end
