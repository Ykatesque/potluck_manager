class CreatePotluck < ActiveRecord::Migration
  def change
    create_table :potlucks do |t|
    t.string :name
    t.date   :date
    end
  end

end
