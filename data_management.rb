require 'sinatra'
require 'sinatra/activerecord'

require_relative 'models/movie'
require 'csv'

class DataManager
	def self.load_movie(filename)

		CSV.foreach(filename, headers: true) do |row|
			movie = Movie.create(
				title: row[1],
				release_year: row[2],
				plot_summary: row[7],
				director: row[9]
				)
		
		end
	end

	def self.update_movies(filename, movies)

		CSV.foreach(filename, headers: true) do |row|
			movie = movies.fing_by(title: row[1])
			movie.update(rating: row[6], poster: tow[0])
		end
	end
end



DataManager.load_movie('public/imdb_top_1000.csv')

movies = Movie.all 
DataManager.update_movies('public/imdb_top_1000', movies)