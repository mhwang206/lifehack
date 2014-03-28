class AddCounterToLike < ActiveRecord::Migration
  def change
    add_column :likes, :counter, :integer
  end
end
