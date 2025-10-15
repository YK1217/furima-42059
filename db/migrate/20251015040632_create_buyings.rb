class CreateBuyings < ActiveRecord::Migration[7.1]
  def change
    create_table :buyings do |t|

      t.timestamps
    end
  end
end
