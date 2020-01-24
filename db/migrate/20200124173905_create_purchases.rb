class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |p|
      p.references :user, foreign_key: true
      p.references :purchase_option, foreign_key: true
      p.timestamps
    end
  end
end