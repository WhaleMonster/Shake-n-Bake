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
    redirect "/sessions/#{user.id}/profile"
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
    redirect "/sessions/#{user.id}/profile" # (need to implement user url page)
  else
    erb :index
  end
end

# signs out a user and detroys the session
delete '/sessions/:id' do
  session[:user_id] = nil
  redirect '/'
end

# ----------- USER PROFILE PAGE ----------------

get '/sessions/:user_id/profile' do
  @user = User.find(params[:user_id])
  @surveys = @user.surveys
  erb :profile
end

# ------------ CREATE NEW SURVEY PAGE -----------

get '/sessions/:user_id/surveys/new' do
  @user = User.find(params[:user_id])
  erb :new
end

post '/sessions/:user_id/surveys' do
  new_survey = Survey.create(title: params[:title])
  current_user.surveys << new_survey
  params.keys.each do |key|
    if key.include?('question')
     Question.create(question: params[key], survey_id: new_survey.id)
    end
  end

end

post '/question' do
  # new_question = Question.create(question: params[:question])
  # if request.xhr?
  #   erb :_question, layout:false, locals: {question: new_question}
  # else
  #   redirect "/sessions/#{current_user.id}/surveys/new"
  # end
end

