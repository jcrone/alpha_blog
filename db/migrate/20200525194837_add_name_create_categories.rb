class AddNameCreateCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :name, :string
    add_column :categories, :created_at, :datetime, null: false
    add_column :categories, :updated_at, :datetime, null: false
  end
end
