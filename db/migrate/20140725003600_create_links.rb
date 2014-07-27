class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :short_name
      t.string :url

      t.timestamps
    end

    add_index :links, :short_name, :unique => true
  end
end
