class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :image
      t.text :ingredients, array: true, default: []
      t.integer :rate
      t.string :budget
      t.bigint :author_id
      t.string :author_tip
      t.timestamps
      t.index :author_id
    end

    create_table :profiles do |t|
      t.string :name
    end
  end
end
