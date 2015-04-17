require 'bundler'
Bundler.require

# ***CONNECTION***
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'chirper'
)

# ***MODELS***
require './models/chirp'
require './models/user'

# ***VIEW ROUTES***
get '/' do
  erb :index
end

# ***API ROUTES***
get '/api/users' do
  content_type :json
  User.all.to_json
end

get '/api/users/:id' do
  content_type :json
  id = params[:id].to_i
  User.find(id).to_json
end

post '/api/users' do
  content_type :json
  new_user = User.create(params[:user]).to_json
end

put '/api/users/:id' do
  content_type :json
  id = params[:id].to_i
  data = params[:user]
  user = User.find(id)
  user.update(data)
  user.to_json
end

patch '/api/users/:id' do
  content_type :json
  id = params[:id].to_i
  data = params[:user]
  user = User.find(id)
  user.update(data)
  user.to_json
end

delete '/api/users/:id' do
  content_type :json
  id = params[:id].to_i
  User.delete(id)
  {message: 'Successfully deleted user'}.to_json
end

get '/api/users/:user_id/chirps' do
  content_type :json
  user = User.find(params[:user_id].to_i)
  user.chirps.to_json
end

get '/api/users/:user_id/chirps/:id' do
  content_type :json
  user = User.find(params[:user_id].to_i)
  user.chirps.find(params[:id].to_i).to_json
end

post '/api/users/:user_id/chirps' do
  content_type :json
  user = User.find(params[:user_id].to_i)
  new_chirp = Chirp.new(params[:chirp])
  user.chirps << new_chirp
  new_chirp.to_json
end

put '/api/users/:user_id/chirps/:id' do
  content_type :json
  user = User.find(params[:user_id].to_i)
  the_chirp = user.chirps.find(params[:id].to_i)
  data = params[:chirp]
  the_chirp.update(data)
  {message: 'Successfully updated'}.to_json
end

put '/api/users/:user_id/chirps/:id' do
  content_type :json
  user = User.find(params[:user_id].to_i)
  the_chirp = user.chirps.find(params[:id].to_i)
  data = params[:chirp]
  the_chirp.update(data)
  {message: 'Successfully updated'}.to_json
end

delete '/api/users/:user_id/chirps/:id' do
  content_type :json
  user = User.find(params[:user_id].to_i)
  the_chirp = user.chirps.find(params[:id].to_i)
  Chirp.delete(the_chirp)
  {message: 'Successfully deleted chirp'}.to_json
end
