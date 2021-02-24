# frozen_string_literal: true

json.array! @tweets, partial: 'api/v1/tweets/tweet', as: :tweet
