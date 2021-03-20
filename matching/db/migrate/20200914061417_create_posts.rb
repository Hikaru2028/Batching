class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :body
      t.references :user
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
