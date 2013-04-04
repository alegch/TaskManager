class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :story

      t.timestamps
    end
    add_index :comments, :story_id
  end
end
