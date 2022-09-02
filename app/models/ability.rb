class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is? :admin
      can :manage, :all
    else
      can :manage, Post, user: user
      can :manage, Comment, user: user
      can :read, :all
    end
  end
end
