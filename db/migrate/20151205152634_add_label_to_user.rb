class AddLabelToUser < ActiveRecord::Migration
  def change
    add_column :users, :label, :string
  end
end
