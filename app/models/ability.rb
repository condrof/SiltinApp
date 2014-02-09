class Ability
  include CanCan::Ability

  def initialize(user)
    if user.kind_of? Supplier
      can :read, ActiveAdmin::Page, :name => "Dashboard"
      can :create, Inventory
      can [ :read, :update, :delete ], Inventory, supplier_id: user.id
      can [ :read, :update ], Supplier, id: user.id
    elsif user.kind_of? Admin
      can :read, ActiveAdmin::Page, :name => "Dashboard"
      can :manage, :all
    else
      can :read, [Product, Inventory]
    end
    
  end
end
