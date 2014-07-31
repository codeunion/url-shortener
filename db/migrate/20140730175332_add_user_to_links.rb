class AddUserToLinks < ActiveRecord::Migration
  def change
    add_column :links, :user, :reference
  end
end
