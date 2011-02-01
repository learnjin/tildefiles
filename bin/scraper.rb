
namespace :db do
  desc "scrape some photos from some site"
  task :fotos=> :environment do
    require 'mechanize'

    srand(Time.now.to_i)

    MAX = 1000
    START = 0

    agent = Mechanize.new
    agent.user_agent_alias="Mac FireFox"

    base_url = "http://somesite.com/images/"

    count = 0
    done = false

    # traverse the pages
    for i in (START..START+MAX) do

      file = "#{i}large.jpg"
      url = base_url + file
      puts "<-- #{url}"
      download_file(url, "../users/#{i}.jpg")
      count += 1
        
    end

  end
end

def download_file(url, path)
  tf = Tempfile.new(File.basename(url))
  File.new(path)
  tf.write(open(url).read)
  tf.close
end

