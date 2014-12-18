get "/" do
  erb :index
end

# ------------- SESSIONS --------------
# shows sign in page if user isn't logged in
get '/sessions/new' do
  erb :index
end

# creates a new user in the database and sets a session
post '/sessions' do
  if user = User.authenticate(params[:user])
    session[:user_id] = user.id
    redirect "/sessions/#{user.id}"
  else
    erb :index
  end
end

# ------------- USERS ---------------

# directs the user to the the index page to sign up
get '/users/new' do
  erb :index
end

# create new user and redirect to user homepage
post '/users' do
  user = User.create(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/sessions/#{user.id}" # (need to implement user url page)
  else
    erb :index
  end
end

