class CreateRuns < ActiveRecord::Migration
  def self.up
    create_table :runs do |t|
      t.string :main
      t.string :opposite
      t.datetime :start
      t.datetime :stop
      t.integer :main_shares
      t.integer :opposite_shares
      t.integer :duration
      t.float :main_enter_price
      t.float :opposite_enter_price
      t.float :main_exit_price
      t.float :opposite_exit_price
      t.float :gain
      t.float :percentgain
    end
    add_index :runs, :main
    add_index :runs, :opposite
    add_index :runs, :gain
    add_index :runs, :start
    add_index :runs, :stop
    add_index :runs, :duration
    add_index :runs, :percentgain
  end

  def self.down
    drop_table :runs
  end
end
