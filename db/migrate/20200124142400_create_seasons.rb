class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |s|
      s.string  :title
      s.text    :plot
      s.integer :number
      s.timestamps
    end
  end
end