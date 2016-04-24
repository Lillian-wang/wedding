class AddGuestsToInvitates < ActiveRecord::Migration
  def change
  	remove_column :wedding_invites, :name, :string
  	remove_column :wedding_invites, :email, :string
  	remove_column :wedding_invites, :num_extra, :integer

  	add_column :wedding_invites, :primary_invitee_name, :string
  	add_column :wedding_invites, :primary_invitee_meal, :string
  	add_column :wedding_invites, :guest_1_name, :string
  	add_column :wedding_invites, :guest_1_meal, :string
  	add_column :wedding_invites, :guest_2_name, :string
  	add_column :wedding_invites, :guest_2_meal, :string
  	add_column :wedding_invites, :guest_3_name, :string
  	add_column :wedding_invites, :guest_3_meal, :string
  	add_column :wedding_invites, :guest_4_name, :string
  	add_column :wedding_invites, :guest_4_meal, :string

  	add_index :wedding_invites, :link_code, unique: true
  end
end
