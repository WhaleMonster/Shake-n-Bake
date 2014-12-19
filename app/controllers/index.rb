# ------------- SESSIONS --------------
get "/" do
  erb :index
end

post '/user' do
  @user = User.find(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/:user_id/profile'
  else
    redirect '/'
  end
end

post '/user/new' do
  @user = User.new(params[:user])
  p @user
  if @user.save
    session[:user_id] = @user.id
    redirect '/:user_id/profile'
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





