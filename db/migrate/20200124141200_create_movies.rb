class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |m|
      m.string :title
      m.text   :plot
      m.timestamps
    end
  end
end