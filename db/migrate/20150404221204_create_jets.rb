class CreateJets < ActiveRecord::Migration
  def change
    create_table :jets do |t|
      t.string :title
      t.string :make
      t.string :jet_model
      t.string :serial_number
      t.string :year
      t.string :price
      t.text :description

      t.timestamps
    end
  end
end
