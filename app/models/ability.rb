class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is? :admin
      can :manage, :all, Post
    else
      can :read, Post
    end
  end
end
