class CreateMems < ActiveRecord::Migration
  def up
  	drop_table :mems

    create_table :mems do |t|
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
