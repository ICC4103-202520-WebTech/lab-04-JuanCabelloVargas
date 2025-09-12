class Room < ApplicationRecord
  def room_info
    "#{number} $#{price}"
  end
end
