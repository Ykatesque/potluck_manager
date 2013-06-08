class AddLocationToPotluck < ActiveRecord::Migration
  def change
    add_column :potlucks, :location, :string


  end
end
