class CreateBabyShowers < ActiveRecord::Migration
  def change
    create_table :baby_showers do |t|
      t.string :father_name
      t.string :mother_name
      t.string :birth_date
      t.string :thank_note
      t.string :description

      t.timestamps
    end

    #referencia para donations. 1 baby shower - n donations
    add_reference :donations, :baby_shower, index: true
  end
end
