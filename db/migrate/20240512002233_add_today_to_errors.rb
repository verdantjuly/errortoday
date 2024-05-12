class AddTodayToErrors < ActiveRecord::Migration[7.1]
  def change
    add_column :errors, :today, :boolean, default: false
  end
end
