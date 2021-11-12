require 'rails_helper'

RSpec.describe 'sessions API' do
  it 'returns the user credentials after a succesfull login', :vcr do
    User.create!(
      email: "whatever@example.com",
      first_name: "First",
      last_name: "Last",
      password: "password",
      password_confirmation: "password"
    )

    body = {
      email: "Whatever@example.com",
      password: "password"
    }

    post '/api/v1/sessions', params: body, as: :json

    expect(response).to be_successful
    expect(response.status).to eq(200)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to have_key(:data)
    expect(user[:data]).to be_a(Hash)
    expect(user[:data].keys.count).to eq(3)
    expect(user[:data]).to have_key(:id)
    expect(user[:data][:id]).to be_a(String)
    expect(user[:data]).to have_key(:type)
    expect(user[:data][:type]).to eq("user")
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to be_a(Hash)
    expect(user[:data][:attributes].keys.count).to eq(4)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes][:email]).to eq(body[:email].downcase)
    expect(user[:data][:attributes]).to have_key(:first_name)
    expect(user[:data][:attributes][:first_name]).to be_a(String)
    expect(user[:data][:attributes]).to have_key(:last_name)
    expect(user[:data][:attributes][:last_name]).to be_a(String)
  end

  it 'returns an error message if the credentials are invalid' do
    User.create!(
      email: "whatever@example.com",
      first_name: "First",
      last_name: "Last",
      password: "password",
      password_confirmation: "password"
    )

    body = {
      email: "Whatever@example.com",
      password: "alecbaldwin"
    }

    post '/api/v1/sessions', params: body, as: :json

    expect(response).to_not be_successful
    expect(response.status).to eq(404)

    response_body = JSON.parse(response.body, symbolize_names: true)

    error_message = { error: "The information does not match any records" }

    expect(response_body).to eq(error_message)
  end
end
