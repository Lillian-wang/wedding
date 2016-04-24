class CreateWeddingInvites < ActiveRecord::Migration
  def change
    create_table :wedding_invites do |t|
      t.string :name
      t.string :email
      t.integer :num_extra
      t.boolean :is_coming
      t.text :extra_comments
      t.string :link_code

      t.timestamps null: false
    end
  end
end
