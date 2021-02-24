# frozen_string_literal: true

class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :status
      t.text :message

      t.timestamps
    end
  end
end
