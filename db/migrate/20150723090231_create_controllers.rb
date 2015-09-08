class CreateControllers < ActiveRecord::Migration

  def up
    create_table :controllers do |t|
      t.string      :controller_name, :limit => 128
    end
  end

  def down
    drop_table  :controllers
  end
end
