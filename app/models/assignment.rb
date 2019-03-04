class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :role
  #has_paper_trail

  def self.destroy_record(user_id, role_id)
    ActiveRecord::Base.connection.execute("update assignments set active=1 where assignments.user_id=#{current_user.id} AND assignments.role_id=#{x.to_i}")
  end

end
