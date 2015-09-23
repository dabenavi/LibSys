class Ability
  include CanCan::Ability

  def initialize(user)
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    # TODO: Put in the correct permissions here for who can see/do which actions of the controllers...

    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :read, :all
    elsif user.library_member?
      can [:show, :update], LibraryMember
      can [:read], Book
    end
  end
end