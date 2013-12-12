class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :email
      t.decimal :value

      t.timestamps
    end
  end
end
