get '/' do
  if session[:id]
      @user = User.find_by(session[:id])
    end
  @users = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  erb :sign_in
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    redirect '/sessions/new'
  end
  # sign-in
end

delete '/sessions/:id' do
  # sign-out -- invoked
  session[:user_id] = nil
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  @user = User.new(params[:user])

  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    redirect '/'
  end
end

# ------------- USERS ---------------
delete '/:user_id/profile' do
  session[:user_id] = nil
  redirect '/'
end

get '/:user_id/profile' do
end

get '/:user_id/surveys/:survey_id' do
end

post '/:user_id/surveys/:survey_id/new' do
end

get '/:user_id/surveys/:survey_id/edit' do
end

put '/:user_id/surveys/:survey_id/edit' do
end

delete '/:user_id/surveys/:survey_id/edit' do
end

get '/:user_id/surveys/:survey_id/results' do
end

get '/surveys/:survey_id' do
end

get '/merci' do
end





