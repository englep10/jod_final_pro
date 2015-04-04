class AddUserIdToJets < ActiveRecord::Migration
  def change
    add_column :jets, :user_id, :integer
  end
end
