class ChangeAddFielsToSettings < ActiveRecord::Migration[6.0]
  def change
    rename_column :settings, :twitter_api_key, :twitter_access_token

    add_column :settings, :twitter_access_token_secret,:string
  end
end
