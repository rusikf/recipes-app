class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :title
      t.index :title, unique: true
      t.timestamps
    end

    create_table :recipes_tags do |rt|
      rt.belongs_to :recipe
      rt.belongs_to :tag
      rt.index %i[recipe_id tag_id], unique: true
    end
  end
end
