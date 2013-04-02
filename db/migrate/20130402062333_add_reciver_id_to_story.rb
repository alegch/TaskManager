class AddReciverIdToStory < ActiveRecord::Migration
  def change
    add_column :stories, :reciver_id, :integer
  end
end
