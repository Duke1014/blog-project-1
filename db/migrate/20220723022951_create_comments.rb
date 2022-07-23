class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.timestamp :published_on

      t.timestamps
    end
  end
end
