class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.belongs_to :subscriber, index: true
      t.belongs_to :subscription, index: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
