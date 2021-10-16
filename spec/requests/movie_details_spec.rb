require 'rails_helper'

RSpec.describe 'sessions API' do
  it 'returns the user credentials after a succesfull login', :vcr do
   user =  User.create!(
      email: "whatever@example.com",
      first_name: "First",
      last_name: "Last",
      password: "password",
      password_confirmation: "password"
    )

    body = { 
      user_id: user.id,
      genre: "horror",
      country: "vietnam",
      release_year: "2013",
      run_time: "223",
      language: "Vietnamese",
      budget: "1000000",
      website: "http://www.example.com",
      production_company: "Universal Studios",
      distribution: "distribution"
     }

    post '/api/v1/movie-details', params: body, as: :json

    expect(response).to be_successful
    expect(response.status).to eq(200)

    movie_detail = JSON.parse(response.body, symbolize_names: true)

    expect(movie_detail).to have_key(:data)
    expect(movie_detail[:data]).to be_a(Hash)
    expect(movie_detail[:data].keys.count).to eq(3)
    expect(movie_detail[:data]).to have_key(:id)
    expect(movie_detail[:data][:id]).to be_a(String)
    expect(movie_detail[:data]).to have_key(:type)
    expect(movie_detail[:data][:type]).to eq("film_epk")
    expect(movie_detail[:data]).to have_key(:attributes)
    expect(movie_detail[:data][:attributes]).to be_a(Hash)
    expect(movie_detail[:data][:attributes].keys.count).to eq(10)
    expect(movie_detail[:data][:attributes]).to have_key(:user_id)
    expect(movie_detail[:data][:attributes][:user_id]).to eq(user.id)
    expect(movie_detail[:data][:attributes]).to have_key(:genre)
    expect(movie_detail[:data][:attributes][:genre]).to be_a(String)
    expect(movie_detail[:data][:attributes]).to have_key(:country)
    expect(movie_detail[:data][:attributes][:country]).to be_a(String)
    expect(movie_detail[:data][:attributes]).to have_key(:release_year)
    expect(movie_detail[:data][:attributes][:release_year]).to be_a(String)
    expect(movie_detail[:data][:attributes]).to have_key(:run_time)
    expect(movie_detail[:data][:attributes][:run_time]).to be_a(Integer)
    expect(movie_detail[:data][:attributes]).to have_key(:language)
    expect(movie_detail[:data][:attributes][:language]).to be_a(String)
    expect(movie_detail[:data][:attributes]).to have_key(:budget)
    expect(movie_detail[:data][:attributes][:budget]).to be_a(Integer)
    expect(movie_detail[:data][:attributes]).to have_key(:website)
    expect(movie_detail[:data][:attributes][:website]).to be_a(String)
    expect(movie_detail[:data][:attributes]).to have_key(:production_company)
    expect(movie_detail[:data][:attributes][:production_company]).to be_a(String)
    expect(movie_detail[:data][:attributes]).to have_key(:distribution)
    expect(movie_detail[:data][:attributes][:distribution]).to be_a(String)
  end 
end 


