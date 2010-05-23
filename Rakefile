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
    # render_page('members', :members => Member.all)
  }
  puts "Generated site in #{time} seconds."
end

desc "Remove generated files"
task :clean do
  ['index','past_meetups','members'].each do |f|
    FileUtils.rm "public/#{f}.html", :force => true
  end
  puts "Generated files removed."
end

task :default => :generate
