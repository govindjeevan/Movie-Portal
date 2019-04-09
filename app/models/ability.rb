class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities'
    #



    if user.role.nil?
      can :read, :all #for guest without roles
      can :home, Movie
    end

    if user.role ==  "customer"
      can :home, Movie
      can :manage, Booking
      cannot :destroy, Booking
      can :read, :all
    end


    if user.role ==  "producer"
      can :home, Movie
      can :manage, Booking
      can :read, :all
      can :manage, Movie
    end

    if user.role ==  "gold_customer"
      can :home, Movie
      can :manage, Booking
      can :destroy, Booking
      can :read, :all
      can :manage, Movie
    end


    if user.role ==  "manager"
      can :home, Movie
      can :manage, Booking
      can :read, :all
      can :update, Theatre
      can :manage, Show
    end

    if user.role ==  "admin"
      can :manage, :all
    end



  end
end
