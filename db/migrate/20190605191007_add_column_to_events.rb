class AddColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :set, :boolean
  end
end
