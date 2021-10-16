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
      genre: "horror",
      country: "vietnam",
      release_year: "2013",
      runtime: "223",
      language: "Vietnamese",
      budget: "1000000",
      website: "http://www.example.com",
      production_company: "Universal Studios",
      distribution: "distribution"
     }

    user = User.last

    post '/api/v1/movie-details', params: body, as: :json

    expect(response).to be_successful
    expect(response.status).to eq(200)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to have_key(:data)
    expect(user[:data]).to be_a(Hash)
    expect(user[:data].keys.count).to eq(1)
    expect(user[:data]).to have_key(:id)
    expect(user[:data][:id]).to be_a(String)
    expect(user[:data]).to have_key(:type)
    expect(user[:data][:type]).to eq("film_epk")
    expect(user[:data]).to have_key(:attributes)
    # expect(user[:data][:attributes]).to be_a(Hash)
    # expect(user[:data][:attributes].keys.count).to eq(3)
    # expect(user[:data][:attributes]).to have_key(:email)
    # expect(user[:data][:attributes][:email]).to eq(body[:email].downcase)
    # expect(user[:data][:attributes]).to have_key(:first_name)
    # expect(user[:data][:attributes][:first_name]).to be_a(String)
    # expect(user[:data][:attributes]).to have_key(:last_name)
    # expect(user[:data][:attributes][:last_name]).to be_a(String)
  end 
end 


