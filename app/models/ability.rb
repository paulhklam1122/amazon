class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Product do |q|
      q.user == user
    end

    can :destroy, Favourite do |f|
      f.user == user
    end

    can :destroy, Like do |l|
      l.user == user
    end

    if user.is_admin?
      can :manage, :all
    else
      can :read, :all
    end
  end
end
