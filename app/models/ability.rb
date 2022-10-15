class Ability
  include CanCan::Ability
  def initilize(user)
    return unless user.present?

    can :read, :all
    can :manage, Group, user: user
    can :manage, Entity, user:
  end
end
