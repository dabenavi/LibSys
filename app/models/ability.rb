class Ability
  include CanCan::Ability

  def initialize(user)
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    # TODO: Put in the correct permissions here for who can see/do which actions of the controllers...

    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :read, :all
      can [:edit, :update, :create, :destroy], Admin
      can [:create, :edit, :update, :destroy], Book
      can [:destroy], LibraryMember
      can [:update, :create], History
    elsif user.library_member?
      can [:show, :update], LibraryMember
      can [:read], Book
      can [:update, :create], History
    else
      can [:create], LibraryMember
    end
  end
end
