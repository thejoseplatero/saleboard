class Devise::OmniauthCallbacksController < ApplicationController
	skip_before_filter :authenticate_user!, only: [:twitter]
	def twitter
		auth = env['omniauth.auth']
		uid = auth['uid']
		provider = auth['provider']
		name = auth['info']['nickname']

		# to see the things twitter gives us comment...
		# raise env['omniauth.auth'].to_yaml

		user = User.where(uid: uid, provider: provider).first_or_create do |u|
			u.email = "#{uid}@twitter.com"
			u.name = name
		end
		sign_in_and_redirect user
	end
end