class AddSenderIdToStory < ActiveRecord::Migration
  def change
    add_column :stories, :sender_id, :integer
  end
end
