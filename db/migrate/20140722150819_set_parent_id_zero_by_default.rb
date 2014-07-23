class SetParentIdZeroByDefault < ActiveRecord::Migration
  def up
    change_column :pages, :parent_id, :integer, default: 0
  end
  def down
    change_column :pages, :parent_id, :integer, default: nil
  end
end
