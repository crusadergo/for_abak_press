class SetRelationToParentPage < ActiveRecord::Migration
  def change
    add_reference :pages, :parent, references: :pages
  end
end
