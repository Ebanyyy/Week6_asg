require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'

require_relative 'models/user'
require_relative 'models/movie'

# movie data has already set in database.

get '/' do 
	erb :index
end 

get '/movies' do 
	@movies = Movie.take(12)
	erb :movies
end

# get '/movies' do 
# 	@movies = Movie.all 
# 	erb :movies
# end

# post '/movies' do 
# 	@movie = Movies.create(title: params[:title], director: params[:director])
# 	if @movie.save
# 		erb :movie 
# 	else
# 		erb :index
# 	end
# end

get '/signup' do 
	erb :signup
end

post '/signup' do 
	@user = User.create(user_name: params[:username], 
						password: params[:password])	
	if @user.save
		redirect '/signin'
	else
		redirect '/signup' 
	end
end

get '/signin' do 
	erb :signin 
end

post '/signin' do 
	@user = User.find_by(user_name: params[:username])
	if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect '/movies'
	else
		erb :signin
	end
end

