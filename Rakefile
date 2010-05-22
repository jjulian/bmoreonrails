require 'benchmark'
require 'haml'
require 'models/meetup'
require 'models/member'

desc "Generate the site"
task :generate do
  time = Benchmark.realtime {
    template = File.read('views/index.haml')
    haml_engine = Haml::Engine.new(template)
    output = haml_engine.render(Object.new, :upcoming_meetups => Meetup.upcoming_meetups)
    File.open('public/index.html', 'w') {|f| f.write(output) }

    # template = File.read('generator/views/members.haml')
    # haml_engine = Haml::Engine.new(template)
    # output = haml_engine.render(Object.new, :members => Member.recent_attendees)
    # File.open('site/members.html', 'w') {|f| f.write(output) }
  }
  puts "Generated site in #{time} seconds."
end

task :default => :generate
