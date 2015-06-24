class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :matcher_id
      t.integer :matchee_id
      t.boolean :rejected, default: false
      t.timestamps null: false
    end
  end
end
