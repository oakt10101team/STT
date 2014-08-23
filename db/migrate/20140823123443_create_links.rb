class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :week
      t.date   :release_date
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
