class ApplicationController < ActionController::Base
    def user_signed_in?
        current_user.present?
    end
        helper_method :user_signed_in?

        helper_method :current_user
      
    private

    def authenticate_user!
        redirect_to new_session_path, alert: "Please sign in" unless user_signed_in?
    end

    def current_user
        @current_user ||= User.find_by_id session[:user_id]
    end

end
