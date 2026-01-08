class CreateShippings < ActiveRecord::Migration[7.1]
  def change
    create_table :shippings do |t|
      t.string :postcode, null:false
      t.integer :area_id, null:false
      t.string :city, null:false
      t.string :building, null:false
      t.string :phone, null:false
      t.references :buying, null:false, foreign_key:true

      t.timestamps
    end
  end
end
