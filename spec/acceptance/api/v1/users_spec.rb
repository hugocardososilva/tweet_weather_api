require 'acceptance_helper'
require 'rails_helper'

resource "User" do
  explanation "User API reference"

  header "Accept", "application/json"
  header "Content-Type", "application/json"
  header "Host", "localhost:3000"

  let(:user) { FactoryBot.create(:user) }
  let(:setting) { FactoryBot.create(:setting) }

   before do
    2.times do |t|
      FactoryBot.create(:user)
    end
  end

  # example object for show, update and destroy
  let(:bank) do
    FactoryBot.create(:usec)
  end

  # object id alias
  let(:id) { user.id }

  # requests

  # index
  get 'api/v1/users' do
    # simulates a request
    example_request "Index" do
      expect(response_status).to eq(200)
    end
  end

  # show
  get 'api/v1/users/:id' do
    # simulates a request
    example_request "Show" do
      expect(response_status).to eq(200)
    end
  end

  # create
  post 'api/v1/users' do

    # set request payload
    let(:raw_post) { {user: user}.to_json }

    # simulates a request
    example_request "Create" do
      expect(response_status).to eq(201)
    end
  end

  # update
  put 'api/v1/users/:id' do

    let(:raw_post) { {user: user}.to_json }

    # simulates a request
    example_request "Update" do
      expect(response_status).to eq(200)
    end
  end

  delete 'api/v1/users/:id' do
    # simulates a request
    example_request "Destroy" do
      expect(response_status).to eq(204)
    end
  end

end
