class Service < ApplicationRecord
  def service_info
    "#{name}, price:#{price}, status:#{is_active}"
  end
end
