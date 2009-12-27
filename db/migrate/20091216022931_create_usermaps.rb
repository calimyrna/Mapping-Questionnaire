class CreateUsermaps < ActiveRecord::Migration
  def self.up
    create_table :usermaps do |t|
      t.string :email
      t.string :address

      t.timestamps
    end
  end

  def self.down
    drop_table :usermaps
  end
end
