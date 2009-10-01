class CreateDeviations < ActiveRecord::Migration
  def self.up
    create_table :deviations do |t|
      t.string :etf
      t.string :base
      t.datetime :start
      t.datetime :stop
      t.float :base_change
      t.float :etf_change
      t.float :degradation
    end
    add_index :deviations, :etf
    add_index :deviations, :base
    add_index :deviations, :start
    add_index :deviations, :stop
    add_index :deviations, :base_change
    add_index :deviations, :etf_change
    add_index :deviations, :degradation
  end

  def self.down
    drop_table :deviations
  end
end
