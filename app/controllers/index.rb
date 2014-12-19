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

# create new survey
get '/sessions/:user_id/surveys/new' do
  @user = User.find(params[:user_id])
  erb :new
end

# show specific survey
get '/sessions/:user_id/surveys/:survey_id' do
  @user = User.find(params[:user_id])
  @survey = Survey.find(params[:survey_id])
  erb :survey
end

# create a new survey
post '/sessions/:user_id/surveys' do
  new_survey = Survey.create(title: params[:title])
  current_user.surveys << new_survey
  params.keys.each do |key|
    if key.include?('question')
     Question.create(question: params[key], survey_id: new_survey.id)
    end
  end
  redirect "/sessions/#{params[:user_id]}/surveys/#{new_survey.id}"
end

# edit a specific survey link
get '/sessions/:user_id/surveys/:survey_id/edit' do
  @user = User.find(params[:user_id])
  @survey = Survey.find(params[:survey_id])
  erb :edit
end

# update the survey changes from edit page
put '/sessions/:user_id/surveys/:survey_id' do
  @edit_survey = Survey.find(params[:survey_id])
  @edit_survey.update(title: params[:title])
  params.keys.each do |key|
    if key.include?('question')
      question_id = key[8..-1].to_i
      @edit_question = Question.find(question_id)
      @edit_question.update(question: params[key])
    end
  end

  redirect "/sessions/#{params[:user_id]}/surveys/#{params[:survey_id]}"
end

# delete the specific question (how to delete a question without refresh the page and redirect/AJAX)
# delete '/sessions/:user_id/surveys/:survey_id/:question_id' do
#   @question = Question.find(params[:question_id])
#   @question.destroy
#   redirect "/sessions/#{params[:user_id]}/surveys/#{params[:survey_id]}"
# end

# delete the specific survey
delete '/sessions/:user_id/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  @survey.destroy
  redirect "/sessions/#{params[:user_id]}/profile"
end

# TODO
# take survey page for non users and update responses

