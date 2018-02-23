class Users < ActiveRecord::Migration[5.1]
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamp
    end
    def self.up
      create_table :items do |t|
        t.string :title
        t.text :description
        t.string :image
        t.timestamps
      end
  end
  def self.down
    drop_table:items
  end
end
