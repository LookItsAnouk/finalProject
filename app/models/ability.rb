class Ability
    include CanCan::Ability

    def initialize(user)

    user ||= User.new #guest user (not logged in)

    if user.present?
        can :create, :update, :destroy, :all
    else
        cannot :read, :all
        can :read, :sign_up
    end

    alias_action :create, :read, :update, :delete, :to => :crud

    can :crud, Migrane do |migrane|
        user == migrane.user
    end
  end
end