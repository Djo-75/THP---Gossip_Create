class UsersController < ApplicationController

    def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    end

    def show
        @users_id = User.find(params[:id])
    end

    def new
        @user = User.new
        # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    end

    def create
        @user = User.new(post_params)

        if @user.save
            redirect_to gossips_path
        else
          render :new, status: :unprocessable_entity
        end
    end

    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)


    def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    end

    def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    end

    def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    end

    private

    def post_params
        params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :city_id, :password)
    end


end
