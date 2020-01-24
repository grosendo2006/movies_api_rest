class PurchaseOption < ApplicationRecord
  has_many :pucharses
  belongs_to :content, polymorphic: true
end