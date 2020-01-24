class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |e|
      e.string     :title
      e.text       :plot
      e.integer    :number
      e.references :season, foreign_key: true
      e.timestamps
    end
  end
end