class AddPasswordDigest < ActiveRecord::Migration
  def change
    remove_column :authors, :password
    add_column :authors, :password_digest, :string
  end
end
