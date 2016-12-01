class FilmFile < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/films/new' do
    erb :new
  end

  post '/films' do
    Film.make(params[:film])
    redirect '/films'
  end
  
  get '/films' do
    @films = Film.all
    erb :films_index
  end

  get '/films/:id' do
    @film = Film.find(params[:id])
    erb :film
  end

  get '/films/:id/edit' do
    @film = Film.find(params[:id])
    erb :edit
  end

  put '/films/:id' do |id|
    Film.update(id, params[:film])
    redirect "/films/#{id}"
  end

  get '/genres' do
    @genres = Genre.all
    erb :genres_index
  end

  get '/directors' do
    @directors = Director.all
    erb :directors_index
    # erb :"/directors/index"
  end

  get '/directors/:id' do |id|
    @director = Director.find(id)
    erb :director
  end

  delete '/films/:id' do |id|
    Film.delete(id)
    redirect "/films"
  end
  
end
