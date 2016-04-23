class CreateMonsterTypes < ActiveRecord::Migration
  def change
    create_table :monster_types do |t|
      t.column :name, :string
    end

    MonsterType.create :name => 'fire'
    MonsterType.create :name => 'water'
    MonsterType.create :name => 'earth'
    MonsterType.create :name => 'electric'
    MonsterType.create :name => 'wind'
  end
end
