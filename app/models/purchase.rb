class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_option

  delegate :content, to: :purchase_option

  def alive?
    (expire_date - self.created_at).to_i > 0
  end

  private

  def expire_date
    self.created_at + 2.days
  end
end