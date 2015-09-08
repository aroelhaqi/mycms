class AddChannelTypeIdToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :channel_type_id, :integer
  end
end
