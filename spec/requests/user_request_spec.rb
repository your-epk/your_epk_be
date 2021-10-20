require 'rails_helper'

RSpec.describe 'users API' do
  before :each do
    @user = User.create!(
      email: "whatever@example.com",
      first_name: "First",
      last_name: "Last",
      password: "password",
      password_confirmation: "password"
    )

    @epk = FilmEpk.create!(
      user_id: @user.id,
      movie_title: "The Best"
    )
  end

  it 'returns the users attributes and relationships' do

    get "/api/v1/users/#{@user.id}"

    expect(response).to be_successful
    expect(response.status).to eq(200)
    user_info = JSON.parse(response.body, symbolize_names: true)

    expect(user_info).to have_key(:data)
    expect(user_info[:data]).to be_a(Hash)
    expect(user_info[:data].keys.count).to eq(4)
    expect(user_info[:data]).to have_key(:id)
    expect(user_info[:data][:id]).to be_a(String)
    expect(user_info[:data]).to have_key(:type)
    expect(user_info[:data][:type]).to eq("user")
    expect(user_info[:data]).to have_key(:attributes)
    expect(user_info[:data][:attributes]).to be_a(Hash)
    expect(user_info[:data][:attributes].keys.count).to eq(3)
    expect(user_info[:data][:attributes]).to have_key(:email)
    expect(user_info[:data][:attributes][:email]).to be_a(String)
    expect(user_info[:data][:attributes]).to have_key(:first_name)
    expect(user_info[:data][:attributes][:first_name]).to be_a(String)
    expect(user_info[:data][:attributes]).to have_key(:last_name)
    expect(user_info[:data][:attributes][:last_name]).to be_a(String)

    expect(user_info[:data]).to have_key(:relationships)
    expect(user_info[:data][:relationships]).to be_a(Hash)
    expect(user_info[:data][:relationships]).to have_key(:film_epks)
    expect(user_info[:data][:relationships][:film_epks]).to be_a(Hash)
    expect(user_info[:data][:relationships][:film_epks]).to have_key(:data)
    expect(user_info[:data][:relationships][:film_epks][:data]).to be_an(Array)

    expect(user_info).to have_key(:included)
    expect(user_info[:included]).to be_an(Array)
    expect(user_info[:included][0]).to have_key(:id)
    expect(user_info[:included][0][:id]).to be_a(String)
    expect(user_info[:included][0]).to have_key(:type)
    expect(user_info[:included][0][:type]).to eq("film_epk")
    expect(user_info[:included][0]).to have_key(:attributes)
    expect(user_info[:included][0][:attributes]).to be_a(Hash)
    expect(user_info[:included][0][:attributes].keys.count).to eq(13)
  end
end
