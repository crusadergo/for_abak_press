class AddColumnUrlToTableRequesting < ActiveRecord::Migration
  def change
    add_column :pages, :url, :string
    add_index :pages, :url
  end
end
