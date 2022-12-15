class MigranesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_migrane, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user!, only:[:edit, :update, :destroy]

    def index
        @migrane = Migrane.order(created_at: :desc)
    end

    def new
        @migrane = Migrane.new
        @user =  current_user
        @symptoms = @user.symptoms_list.split(',')
        @triggers = @user.triggers_list.split(',')
        @medications = @user.meds_list.split(',')
        
    end

    def create
        @migrane = Migrane.new(migrane_params)
        
        @migrane.user = current_user
        if @migrane.is_valid?
            if @migrane.save 
                flash[:success] = "auction successfully created"
                redirect_to @migrane
            else
                flash[:error] = "Something went wrong"
                render 'new'
            end
        else
        flash[:alert] = "Please Add Title and Body"
            redirect_to new_migrane_path(@migrane)
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def update
     if @migrane.update(migrane_params)
            flash[:success] = "Record successfully updated"
            redirect_to @migrane
        else
            flash[:error] = "Something went wrong"
            render :edit  
        end
    end

    def edit
    
    end

    def destroy
        @migrane.destroy
        redirect_to migranes_path
    end

    private

    def migrane_params
        #add medications, symptoms, triggers figure out how to populate from list.
        params.require(:migrane).permit(
            :migrane_date, 
            :severity, 
            :notes,
            :medications,
            :triggers,
            :symptoms
        )
    end
    
    def find_migrane
        @migrane = Migrane.find params[:id]
    end

    def authorize_user!
        redirect_to root_path, alert: "Not authorized!" unless can?(:crud, @migrane)
    end  

end
