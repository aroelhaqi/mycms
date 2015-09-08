class CreateUsers < ActiveRecord::Migration

  def change
    change_table(:users) do |t|
      t.column :user_group_id, :integer
    end
  end

  def up
    create_table :users do |t|
      t.string  :username
      t.string  :password
      t.string  :email
      t.integer :user_group_id
      t.string  :firstname
      t.string  :lastname
      t.integer :created_by
      t.datetime  :created_at
      t.datetime  :lastlogin_date_at
      t.integer   :lastlogin_time_at
    end
  end

  def down
    drop_table :users
  end
end
