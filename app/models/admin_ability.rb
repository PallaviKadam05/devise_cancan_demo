class Admin_ability
  include CanCan::Ability
  def initialize(user)
  	 user ||= User.new # Guest user

    
     # if user.seller?
     #    can :read, Store
     # end
     if user.admin?
      can :manage, :all
     end
 end
  
end