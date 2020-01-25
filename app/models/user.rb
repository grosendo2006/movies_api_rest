class User < ApplicationRecord
  has_many :purchases

  def library
    self.purchases.select {|p| p.alive? }.sort_by(&:remaining_time)
  end

  def in_library?(content)
    library.any? {|purchase| purchase.content.id == content.id }
  end
end