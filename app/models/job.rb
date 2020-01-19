class Job < ApplicationRecord
    validates :title, presence: true
    
  def admin?
    is_admin
  end
end
