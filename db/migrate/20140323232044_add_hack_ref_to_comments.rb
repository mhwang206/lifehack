class AddHackRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :hack, index: true
  end
end
