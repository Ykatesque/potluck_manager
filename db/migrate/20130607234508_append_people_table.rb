class AppendPeopleTable < ActiveRecord::Migration
  def change
    add_column :people, :relationship, :boolean, :default => false


  end
end
