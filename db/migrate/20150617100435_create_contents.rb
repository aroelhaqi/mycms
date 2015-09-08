class CreateContents < ActiveRecord::Migration

  def up
    create_table :contents do |t|
      t.integer   :category_id, :limit => 11
      t.integer   :uid, :limit => 11
      t.string    :title, :limit => 512
      t.string    :summary, :limit => 512
      t.text    :description, :limit => 1024
      t.string    :images, :limit => 512
      t.string    :thumbnail, :limit => 512
      t.string    :video
      t.integer   :status
      t.datetime  :publish_date_at
      t.datetime  :unpublish_date_at
      t.integer   :unpublish_date_status
      t.string    :tag
      t.string    :keyword
      t.integer   :create_time_at
      t.datetime  :create_date_at
      t.integer   :update_time_at
      t.datetime  :update_date_at
    end
  end

  def down
    drop_table :contents
  end

end
