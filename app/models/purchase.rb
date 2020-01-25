class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_option

  delegate :content, to: :purchase_option

  def alive?
    remaining_time.to_i > 0
  end

  def remaining_time
    (expire_date - Time.zone.now)
  end

  private

  def expire_date
    self.created_at + 2.days
  end
end