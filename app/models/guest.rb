class Guest < ApplicationRecord
  def guest_info
    "#{first_name} #{last_name}"
  end
end
