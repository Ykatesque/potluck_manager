class AddPersonToItem < ActiveRecord::Migration
  def up
    add_column :items, :person_id, :integer
  end

def down
    remove_column :items, :person_id
  end
end