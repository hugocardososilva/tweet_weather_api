# frozen_string_literal: true

class Setting < ApplicationRecord
  belongs_to :user

  enum lang: { pt_br: 'pt_br' }
  enum units: { metric: 'metric', imperial: 'imperial' }
end
