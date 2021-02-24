class Tweet < ApplicationRecord
  belongs_to :user

  enum status: { error: "error", done: "done"}

end
