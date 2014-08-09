class CreateMems < ActiveRecord::Migration
  def change
    create_table :mems do |t|
      t.string :description

      t.timestamps
    end
  end
end
