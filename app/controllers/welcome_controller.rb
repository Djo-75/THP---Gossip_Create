class WelcomeController < ApplicationController
    def welcome_section
        @user = User.find(params:[:welcome_section])
    end
end
