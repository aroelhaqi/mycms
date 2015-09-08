class AddUpdateAtToChannelTypes < ActiveRecord::Migration
  def change
    add_column :channel_types, :update_at, :datetime
  end
end
