class CreateIdea < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.string :title
      t.timestamps null: false
    end
  end
end
