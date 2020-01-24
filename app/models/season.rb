class Season < ApplicationRecord
  has_many :episodes, -> { order(:number) }
  has_many :users, through: :purchases
  has_many :purchases
  has_many :purchase_options
end