class WelcomeController < ApplicationController
    def welcome_customize
        @user = params[:id] # mon entrée URL va être stockée dans ma variable d'instance @user
    end
    
    def welcome_display
    end
end

