class CreateHacks < ActiveRecord::Migration
  def change
    create_table :hacks do |t|
      t.string :description

      t.timestamps
    end
  end
end
