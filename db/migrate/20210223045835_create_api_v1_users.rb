# frozen_string_literal: true

class CreateApiV1Users < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :name
      t.string :password

      t.timestamps
    end
  end
end
