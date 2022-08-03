class AddUserToIdeas < ActiveRecord::Migration[7.0]
  def change
    add_reference :ideas, :user, foreign_key: true, null: false
  end
end
