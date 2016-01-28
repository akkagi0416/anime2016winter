require 'twitter'
require 'dotenv'
require_relative 'db.rb'
require 'logger'

Dotenv.load
$logger = Logger.new('anime.log')

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['CONSUMER_KEY']
  config.consumer_secret     = ENV['CONSUMER_SECRET']
  config.access_token        = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_SECRET']
end

Anime.where.not('screen_name': nil).each do |anime|
  today = Time.now.strftime("%Y-%m-%d")
  next unless anime.records.where(date: today).empty?

  begin
    followers_count = client.user(anime.screen_name).followers_count
    img             = client.user(anime.screen_name).profile_image_url.to_s
    anime.update(img: img.sub(/_normal/, '_200x200'))
    anime.records.create(
      date: today,
      followers_count: followers_count
    )

    $logger.info(anime.title)
  rescue => e
    $logger.error e
  end
end
