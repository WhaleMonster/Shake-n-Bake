class Seed 
	def self.run
		users = [{username: "Anna", email: "anna@gmail.com", password: "anna" }, 
			{username: "Lance", email: "lance@gmail.com", password: "lance"}, 
			{username: "Michelle", email: "michelle@gmail.com", password: "michelle"}, 
			{username: "Kevin", email: "kevin@gmail.com", password: "kevin"}, 
			{username: "Tina", email: "tina@gmail.com", password: "tina"}]
		users.each { |user| User.create(user)}

		surveys = [
			{title: "Python", user_id: 1}, #survey 1
			{title: "Music", user_id: 2}, #survey 2
			{title: "Art", user_id: 3}, #survey 3
			{title: "Existentialism", user_id: 4}, #survey 4
			{title: "DBC", user_id: 1}, #survey 5
			{title: "Games", user_id: 5}, #survey 6
			{title: "Presents", user_id: 2}, #survey 7
			{title: "Travel", user_id: 3}, #survey 8
			{title: "Engineering EmpathyE", user_id: 4}, #survey 9
		]
		surveys.each {|survey| Survey.create(survey)}

		questions = [
			{question: "What is your name?" , survey_id: 1}, #question 1
			{question: "What is your quest?", survey_id: 1}, #question 2
			{question: "An African swallow or a European swallow?", survey_id: 1}, #question 3
			{question: "Who is your favorite singer?", survey_id: 2}, #question 4
			{question: "What is your favorite song?", survey_id: 2}, #question 5
			{question: "What is your favorite color?", survey_id: 3}, #question 6
			{question: "Who is your favorite artist?", survey_id: 3}, #question 7
			{question: "Who?", survey_id: 4}, #question 8
			{question: "What?", survey_id: 4}, #question 9
			{question: "Where?", survey_id: 4}, #question 10
			{question: "When?", survey_id: 4}, #question 11
			{question: "Why?", survey_id: 4}, #question 12
			{question: "Who is your favorite instructor?", survey_id: 5}, #question 13
			{question: "What is your favorite language?", survey_id: 5}, #question 14
			{question: "On a scale of -2 to 7, how much to you love/hate scales with random endpoints?", survey_id: 5}, #question 15
			{question: "Video games or board games?", survey_id: 6}, #question 16
			{question: "What's your favorite?", survey_id: 6}, #question 17
			{question: "What did you bring to White Elephant today?", survey_id: 7}, #question 18
			{question: "How many states have you visited?", survey_id: 8}, #question 19
			{question: "How many countries have you been to?", survey_id: 8}, #question 20
			{question: "Where is your favorite place in the world to be?", survey_id: 8}, #question 21
			{question: "How much do you love Engineering Empathy?", survey_id: 9}, #question 22
			{question: "What was your favorite topic?", survey_id: 9}, #question 23
			{question: "Did you think this quiz was about the programming language?", survey_id: 1} #question 24
		]
		questions.each {|question| Question.create(question)}

		responses = [
			{response: "Arthur, king of the Brittons", question_id: 1},
			{response: "What?", question_id: 1},
			{response: "I seek the holy grail!", question_id: 2},
			{response: "Say what one more time.  English mofo, do you speak it??", question_id: 2},
			{response: "I don't knoo........!", question_id: 3},
			{response: "What?", question_id: 3},
			{response: "Taylor Swift", question_id: 4},
			{response: "T.Swift 4eva!!", question_id: 4},
			{response: "zomg Taylor", question_id: 4},
			{response: "Shake it off", question_id: 5},
			{response: "The one where she's all like, obsessive about some dude", question_id: 5},
			{response: "Blue", question_id: 6},
			{response: "Purple", question_id: 6},
			{response: "Black.  That's how metal I am", question_id: 6 },
			{response: "Picasso", question_id: 7},
			{response: "Dali", question_id: 7},
			{response: "Prince", question_id: 7},
			{response: "Someone", question_id: 8},
			{response: "Something", question_id: 9},
			{response: "Some time", question_id: 10},
			{response: "Somewhere", question_id: 11},
			{response: "Because", question_id: 12},
			{response: "Derek", question_id: 13},
			{response: "Derek", question_id: 13},
			{response: "Ruby", question_id: 14},
			{response: "Is ActiveRecord a language?", question_id: 14},
			{response: "JavaScript", question_id: 14},
			{response: "50.  I'm clever because I picked a number outside the range", question_id: 15},
			{response: "-10.  I don't understand the assignment", question_id: 15},
			{response: "Video games", question_id: 16},
			{response: "Video games", question_id: 16},
			{response: "Smash Brothers!", question_id: 17},
			{response: "RockBand!", question_id: 17},
			{response: "Booze", question_id: 18},
			{response: "Booze", question_id: 18},
			{response: "Beer", question_id: 18},
			{response: "Liquor", question_id: 18},
			{response: 18, question_id: 19},
			{response: 12, question_id: 19},
			{response: 2, question_id: 19},
			{response: 6, question_id: 20},
			{response: 4, question_id: 20},
			{response: 13, question_id: 20},
			{response: "Germany", question_id: 21},
			{response: "Japan", question_id: 21},
			{response: "Hawaii", question_id: 21},
			{response: "Love it so so much!", question_id: 22},
			{response: "Sobs...", question_id: 22},
			{response: "Ragequit!! Blargh!", question_id: 22},
			{response: "Sexism was so awesome!", question_id: 23},
			{response: "stupid super-ego  :( ", question_id: 23},
			{response: "F(*&ing B(*&S@# triggers", question_id: 23},
		]
		responses.each {|response| Response.create(response)}	
	end
end