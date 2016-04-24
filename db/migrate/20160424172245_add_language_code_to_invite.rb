class AddLanguageCodeToInvite < ActiveRecord::Migration
  def change
  	add_column :wedding_invites, :language_code, :string
  end
end
