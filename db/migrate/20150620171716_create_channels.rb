class CreateChannels < ActiveRecord::Migration
  def up
    create_table :channels do |t|
      t.string      :channel_name, :limit => 128
      t.integer     :parent_id
      t.datetime    :create_at
      t.datetime    :update_at
      t.integer     :create_time_at
      t.integer     :update_time_at
    end
  end

  def down
    drop_table  :channels
  end

end
