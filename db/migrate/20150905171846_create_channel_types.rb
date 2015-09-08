class CreateChannelTypes < ActiveRecord::Migration
  def up
    create_table :channel_types do |t|
      t.string    :channel_type_name, :limit => 128
      t.datetime  :create_at
      t.datetime  :update_at
    end
  end

  def down
    drop_table  :channel_types
  end
end
