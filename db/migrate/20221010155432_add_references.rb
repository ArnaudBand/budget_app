class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :lists, :user, foreign_key: true
    add_reference :groups, :user, foreign_key: true
    add_reference :groups, :list, foreign_key: true
    add_reference :lists, :group, foreign_key: true
  end
end
