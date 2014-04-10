class CreateCreditcards < ActiveRecord::Migration
  def change
    create_table :creditcards do |t|
      t.integer :customer_id
      t.string :cardnum
      t.date :expire_on

      t.timestamps
    end
  end
end
