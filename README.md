# Limesurvey

This is the initial commit of the site. The goal of this gem is to have an easy Ruby on Rails interface to
LimeSurvey.

http://www.limesurvey.org/

LimeSurvey is a PHP::Yi based web application that allows users to create, manage, and review surveys.

## Installation

Add this line to your application's Gemfile:

    gem 'limesurvey'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install limesurvey

## Usage

Add to your environment development.rb and production.rb if you have separate servers. Otherwise, you can add 
to your environment.rb. Make sure that you have the JSON RPC enabled on the LimeSurvey site.

	LIMESURVEY_USERNAME = "username"
	LIMESURVEY_PASSWORD = "password"

Change the url and protocol to match your settings.

  	LIMESURVEY_API_URL = "http://url/index.php?r=admin/remotecontrol"  
  	LIMESURVEY_SSO_URL = "http://url/index.php?r=admin/authentication/sa/login"
  	LIMESURVEY_SUR_URL = "http://url/index.php?r=survey/index/sid"
