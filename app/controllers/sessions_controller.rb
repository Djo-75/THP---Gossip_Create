class SessionsController < ApplicationController
  before_action :authenticate_user, only: [:index]

    def new
    end

    def create
      # cherche s'il existe un utilisateur en base avec l’e-mail

      user = User.find_by(email: params[:email])
      # puts "||||||||||||||||||||||||||||||||||||"
      # puts user.id
      # puts user.first_name
      # puts user.last_name
      # puts user.password_digest
      # puts "||||||||||||||||||||||||||||||||||||"

      # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 

      if user.email == params[:email] && user.authenticate(params[:password])
        session[:user_id] = user.id
      # puts "*****************"
      # puts "ça marche"
      # puts "!!!!!!!!!!!!!!!!"

      redirect_to root_path
        # redirige où tu veux, avec un flash ou pas

      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end

    def destroy
      session.delete(:user_id)
    end
end
