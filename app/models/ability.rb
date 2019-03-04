class Ability
  include CanCan::Ability

  def initialize(user)
    user=user||User.new
    permissions(user)
    if user.try(:admin?)
      can :manage, :all
    end
  end

  def permissions(user)
    roles=Assignment.where(:user_id=>user,:active=>true).pluck(:role_id)

    designations=user.designation_mappings.where(:active=>true).map{|x| x.roles}.flatten.uniq
  end
end
# Define abilities for the passed in user here.
