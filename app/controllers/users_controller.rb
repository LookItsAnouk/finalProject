class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update]
    
    def new
        @user = User.new
    end
        
    def create
        @user = User.new user_params
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Logged In!"
        else
            render :new
        end
    end

    def edit
        
    end

    def show
    
    end

    def home
        render :home
    end
      
    def update

        if @user.update(user_params)
            flash[:success]
        else
            flash[:alert] = user.errors.full_messages.join(", ")
        end
        redirect_to migraines_path
    end

    private

    def find_user
        @user = User.find(params[:id])
      end

    def user_params
        params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation,
        :menstruator,
        :meds_list,
        :triggers_list,
        :symptoms_list,
        )
    end
end
