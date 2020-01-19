class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :long_url
      t.string :short_url
      t.integer :user_id
      t.integer :click_count

      t.timestamps
    end
  end
end
