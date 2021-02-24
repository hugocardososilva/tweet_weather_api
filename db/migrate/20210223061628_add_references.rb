# frozen_string_literal: true

class AddReferences < ActiveRecord::Migration[6.0]
  def change
    add_reference :settings, :user, foreign_key: true
  end
end
