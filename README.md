# Limesurvey

This is a working API to communicate with the LimeSurvey 2.0.5 RemoteControl2 API. 
Previous versions have not been tested. I'm currently using this to interface with the tokens of a given survey.
Within my Rails Application, I have a list of users that I can assign to a survey. When I assign them to a survey,
I send the First name, Last name and Email address. I'm returned a token. I store this token in a database that where

	user model
		has_many :user_surveys
		
The user_surveys model is used to store the user_id and the token returned. From here, I can list all users that have
received the survey and also completed it.



http://www.limesurvey.org/

LimeSurvey is a PHP::Yi based web application that allows users to create, manage, and review surveys.

## Installation

Add this line to your application's Gemfile:

    gem 'limesurvey'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install limesurvey

Add to your environment development.rb and production.rb if you have separate servers. Otherwise, you can add 
to your environment.rb. Make sure that you have the JSON RPC enabled on the LimeSurvey site.

	LIMESURVEY_USERNAME = "username"
	LIMESURVEY_PASSWORD = "password"


Change the url and protocol to match your settings.

  	LIMESURVEY_API_URL = "http://url/index.php?r=admin/remotecontrol"  
  	LIMESURVEY_API = Limesurvey::API.new(LIMESURVEY_API_URL)

## Usage

	session_key = LIMESURVEY_API.get_session_key(limesurvey_username,limesurvey_password)
	participant = LIMESURVEY_API.get_participant_properties(LIMESURVEY_API_SESSION_KEY, sid, tid, [property])

## Example Helpers
Gets and returns participant token properties

	def limesurvey_get_participant_properties(sid, tid, property)
	    #@lime_survey_api = LimeSurvey::API.new(LIMESURVEY_API_URL)
	    #@session_key = @lime_survey_api.get_session_key(LIMESURVEY_USERNAME,LIMESURVEY_PASSWORD)
	    
	    participant = LIMESURVEY_API.get_participant_properties(LIMESURVEY_API_SESSION_KEY, sid, tid, [property])
	    #@lime_survey_api.release_session_key(@session_key)
	    response = JSON.parse(participant.to_json)
	    return response[property]
	end

Gets and returns the Survey Title

		def get_limesurvey_title(surveys, sid)
		    surveys.each do |item|
		      survey = JSON.parse(item.to_json)	      
		      if sid == survey["sid"]
		      	return survey["surveyls_title"] 
	
		      end
		    end
		end

## License

(The MIT License)

Copyright © 2009-2013 Dave Kimura

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
