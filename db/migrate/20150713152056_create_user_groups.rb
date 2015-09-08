class CreateUserGroups < ActiveRecord::Migration

  def up
    create_table :user_groups do |t|
      t.string  :user_group_name
      t.string  :user_create
    end
  end

  def down
    drop_table :user_groups
  end

end
