require 'sinatra'
require_relative 'db.rb'

get '/' do
  today = Time.now.strftime("%Y-%m-%d")
  # @animes = Anime.where.not(screen_name: nil)
  # @animes = Anime.where.not(screen_name: nil).joins(:records).where("records.date = ? AND screen_name not null", today).order("followers_count desc")
  @animes = Anime.where.not(screen_name: nil).sort_by {|anime| anime.records.today[0].followers_count }.reverse
  erb :index
end
