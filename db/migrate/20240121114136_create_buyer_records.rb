class CreateBuyerRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :buyer_records do |t|
      t.string :postal_cade              , null: false, default: ""
      t.integer :prefecture_id           , null: false
      t.string :city                     , null: false, default: ""
      t.string :addresses                , null: false, default: ""
      t.string :building
      t.string :phone_number             , null: false, default: ""
      t.references :order                , null: false, foreign_key: true
      t.timestamps
    end
  end
end
