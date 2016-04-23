class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.column :name, :string
      t.column :power, :string
      t.column :monstertype_id, :integer, null: false

      t.column :created_at, :timestamp
    end
  end
end
