class AddDoneBool < ActiveRecord::Migration
  def change
    add_column :supporters, :done, :boolean
  end
end
