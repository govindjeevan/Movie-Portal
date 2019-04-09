class Ability
  include CanCan::Ability

  def initialize(user)
    user = user || User.new
    permissions(user)
  end

  def permissions(user)
    role = user.role
    if user.role.nil?
      can :read, :all #for guest without roles
    else
      File.readlines("permissions/#{role.downcase}.rb").each do |f|
        eval(f)
      end
    end
  end
end
