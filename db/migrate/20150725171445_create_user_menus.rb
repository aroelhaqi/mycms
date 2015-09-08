class CreateUserMenus < ActiveRecord::Migration

  def up
    create_table :user_menus do |t|
      t.string    :name, :limit => 128
      t.integer   :controller_id
      t.string    :parameter
      t.integer   :parent_menu_id
    end
  end

  def down
    drop_table  :user_menus
  end

end
