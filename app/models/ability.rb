class Ability
  include CanCan::Ability

  def initialize(user)
    can :destroy, Food, user_id: user.id
    can :destroy, Recipe, user_id: user.id
    can :destroy, RecipeFood, user_id: user.id
    can :update, Recipe, user_id: user.id

    can :create, Food
    can :create, Recipe

    can :read, Food
    can :read, Recipe
  end
end
