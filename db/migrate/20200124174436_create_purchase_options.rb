class CreatePurchaseOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_options do |p|
      p.references :content, polymorphic: true
      p.float      :price
      p.string     :video_quality
      p.timestamps
    end
  end
end