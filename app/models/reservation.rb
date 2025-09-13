class Reservation < ApplicationRecord
  def reservation_info
    "Code: #{code}, Adults: #{adults}, Check-In: #{check_in}, Check-Out: #{check_out}"
  end
end
