class CreateRecords < ActiveRecord::Migration
  def self.up
    create_table :records do |t|
      t.string :ticker
      t.datetime :trade_date
      t.float :open
      t.float :close
      t.float :adj_close
    end
    add_index :records, :ticker
    add_index :records, :trade_date
    add_index :records, :open
    add_index :records, :close
    add_index :records, :adj_close
  end

  def self.down
    drop_table :records
  end
end
