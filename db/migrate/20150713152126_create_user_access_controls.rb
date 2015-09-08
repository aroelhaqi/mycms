class CreateUserAccessControls < ActiveRecord::Migration

  def up
    create_table :user_access_controls do |t|
      t.integer  :user_group_id
    end
  end

  def down
    drop_table :user_groups
  end
end
