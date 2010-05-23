require 'benchmark'
require 'haml'
require 'models/meetup'

def render_page(name, hash = {})
  template = File.read("views/#{name}.haml")
  haml_engine = Haml::Engine.new(template)
  output = haml_engine.render(Object.new, hash)
  File.open("public/#{name}.html", 'w') {|f| f.write(output) }
end

desc "Generate the site"
task :generate do
  time = Benchmark.realtime {
    render_page('index', :meetups => Meetup.upcoming_meetups)
    # render_page('members', :members => Member.recent_attendees)
  }
  puts "Generated site in #{time} seconds."
end

task :default => :generate
