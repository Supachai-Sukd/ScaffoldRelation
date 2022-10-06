class AddEmailToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :mail, :text
  end
end
