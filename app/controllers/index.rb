get "/" do
  erb :index
end

# ------------- SESSIONS --------------
# checks the database to see if user exists
post '/sessions' do
  if user = User.authenticate(params)
    session[:user_id] = user.id
    redirect "/sessions/#{user.id}/profile"
  else
    flash[:error] = "Sorry, that combination is busted"
    redirect '/'

  end
end

# create new user and redirect to user homepage
post '/users' do
  user = User.create(params)
  if user.save
    session[:user_id] = user.id
    redirect "/sessions/#{user.id}/profile" # (need to implement user url page)
  else
    @output = user.errors.full_messages
    flash[:error] = @output
    redirect '/'
  end
end

# signs out a user and detroys the session
delete '/sessions/:user_id/profile' do
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

# posting a new survey
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

# delete a specific survey link

delete "/sessions/:user_id/surveys/:survey_id" do
  survey_to_delete = Survey.find(params[:surveyId])
  survey_to_delete.destroy
end


# delete a question from a specific survey

delete '/sessions/:user_id/questions/:question_id' do
  question_to_delete = Question.find(params[:question_id])
  question_to_delete.destroy
end


# ------------- USERS ---------------

# Show survey results after user logged in
get '/sessions/:user_id/surveys/:survey_id/results' do
  @survey = Survey.find(params[:survey_id])
  erb :result
end

get '/sessions/surveys/:survey_id' do
end

get '/merci' do
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
delete '/sessions/:user_id/surveys/:survey_id/:question_id' do
  @question = Question.find(params[:question_id])
  @question.destroy
  # redirect "/sessions/#{params[:user_id]}/surveys/#{params[:survey_id]}"
end

# delete the specific survey
delete '/sessions/:user_id/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  @survey.destroy
  redirect "/sessions/#{params[:user_id]}/profile"
end

# TODO
# take survey page for non users and update responses
get '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :answer
end

post '/surveys/:survey_id' do
  # find the question and shuffle in the answer for that question in the database
  params.keys.each do |key|
    if key.include?('answer')
      question_id = key[6..-1].to_i
      Response.create(response: params[key], question_id: question_id)
    end
  end
  redirect '/'
  # should flash some message for thanking you taking the survey and here are some more survey you can take
end
