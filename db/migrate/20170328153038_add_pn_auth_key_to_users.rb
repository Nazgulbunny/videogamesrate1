class AddPnAuthKeyToUsers < ActiveRecord::Migration[5.1]
  def change
		add_column :users, :pn_auth_key, :string
  end
end
