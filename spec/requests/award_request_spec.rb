require 'rails_helper'

RSpec.describe 'awards API' do
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

  it 'creates a flim epk award' do
    body = {
        award: {
          name: "The Super Award",
          year: "1999",
          award_type: "Shiny",
          film_epk_id: @epk.id
        }
    }

    post "/api/v1/awards", params: body, as: :json

    expect(response).to be_successful
    expect(response.status).to eq(200)
    award_info = JSON.parse(response.body, symbolize_names: true)

    expect(award_info).to have_key(:data)
    expect(award_info[:data]).to be_a(Hash)
    expect(award_info[:data].keys.count).to eq(3)
    expect(award_info[:data]).to have_key(:id)
    expect(award_info[:data][:id]).to be_a(String)
    expect(award_info[:data]).to have_key(:type)
    expect(award_info[:data][:type]).to eq("award")
    expect(award_info[:data]).to have_key(:attributes)
    expect(award_info[:data][:attributes]).to be_a(Hash)
    expect(award_info[:data][:attributes].keys.count).to eq(4)
    expect(award_info[:data][:attributes]).to have_key(:name)
    expect(award_info[:data][:attributes][:name]).to be_a(String)
    expect(award_info[:data][:attributes]).to have_key(:year)
    expect(award_info[:data][:attributes][:year]).to be_a(String)
    expect(award_info[:data][:attributes]).to have_key(:award_type)
    expect(award_info[:data][:attributes][:award_type]).to be_a(String)
    expect(award_info[:data][:attributes]).to have_key(:film_epk_id)
    expect(award_info[:data][:attributes][:film_epk_id]).to eq(@epk.id)
  end
end
