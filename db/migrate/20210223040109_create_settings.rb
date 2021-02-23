class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
      t.string :openwather_key
      t.string :twitter_api_key
      t.string :lang
      t.string :units

      t.references :user, index: true

      t.timestamps
    end
  end
end
