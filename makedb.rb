require 'active_record'
require_relative 'db.rb'


doc = open('title.md').read

doc.each_line do |line|
  line.match(/「(.+?)」.*\((.*)\)/)
  title = $1
  url   = $2

  if url.match(%r{twitter.com/(.+)})
    screen_name = $1.gsub(/\?lang=ja/, '') 
  else
    official = url
  end

  anime = Anime.find_or_create_by(title: title)

  if official != nil
    anime.update(official: official)
  end

  if screen_name != nil
    anime.update(screen_name: screen_name)
  end

  # if official != nil
  #   puts "#{title} official #{official}"
  # end
  #
  # if screen_name != nil
  #   puts "#{title} @twitter #{screen_name}"
  # end
end
