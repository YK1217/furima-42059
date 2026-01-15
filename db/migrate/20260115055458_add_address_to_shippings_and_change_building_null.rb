class AddAddressToShippingsAndChangeBuildingNull < ActiveRecord::Migration[7.1]
  def change
    add_column :shippings, :address, :string, null: false, default: ""

    change_column_null :shippings, :building, true
  end
end
