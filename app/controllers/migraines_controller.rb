class MigrainesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show, :home]
    before_action :find_migraine, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user!, only:[:edit, :update, :destroy]

    def index
        @migraine = Migraine.order(created_at: :desc)
    end

    def new
        @migraine = Migraine.new
        @user =  current_user
        @symptoms = @user.symptoms_list.split(',').to_a
        @triggers = @user.triggers_list.split(',').to_a
        @medications = @user.meds_list.split(',').to_a
        
    end


    def create
        @migraine = Migraine.new(migraine_params)
        @migraine.user = current_user
        
        if @migraine.is_valid?
            
            if @migraine.save 
                flash[:success] = "Migraine added"
                redirect_to @migraine
            else
                flash[:error] = "Something went wrong"
                render 'new'
            end
        else
        flash[:alert] = "Please Add Title and Body"
            redirect_to new_migraine_path(@migraine)
        end
    end

    def show
        @migraine = Migraine.find params[:id]
    end

    def update
     if @migraine.update(migraine_params)
            flash[:success] = "Record successfully updated"
            redirect_to @migraine
        else
            flash[:error] = "Something went wrong"
            render :edit  
        end
    end

    def edit
        @user =  current_user
        @symptoms = @user.symptoms_list.split(',').to_a
        @triggers = @user.triggers_list.split(',').to_a
        @medications = @user.meds_list.split(',').to_a
    end

    def destroy
        @migraine.destroy
        redirect_to migraines_path
    end

    def calendar
        @migraines = Migraine.all
       
    end


    private

    def migraine_params
        params.require(:migraine).permit(
            :migraine_date, 
            :severity, 
            :notes,
            medications: [],
            triggers: [],
            symptoms: []
        )
    end
    
    def find_migraine
        @migraine = Migraine.find params[:id]
    end

    def authorize_user!
        redirect_to root_path, alert: "Not authorized!" unless can?(:crud, @migraine)
    end  

end
