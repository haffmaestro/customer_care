class CreateSupporters < ActiveRecord::Migration
  def change
    create_table :supporters do |t|
      t.string :name
      t.string :email
      t.string :department
      t.text :message

      t.timestamps
    end
  end
end
