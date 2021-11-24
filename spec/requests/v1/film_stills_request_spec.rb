require 'rails_helper'

RSpec.describe 'film stills API' do
  before :each do
    @user = User.create!(
      email: "whatever@example.com",
      first_name: "alec",
      last_name: "baldwin",
      password: "password",
      password_confirmation: "password"
    )

    @epk = FilmEpk.create!(
      user_id: @user.id,
      movie_title: "Rust"
    )

    @ff = FilmFam.create!(
      role: "Actor",
      first_name: "Alec",
      last_name: "Baldwin",
      description: "poppa smurfs",
      film_epk_id: @epk.id
    )

    @fl = FilmStill.create!(
      description: "This is a picture of Alec Balwdin",
      film_epk_id: @epk.id
    )

    body = {
      email: "Whatever@example.com",
      password: "password"
    }

    post '/api/v1/sessions', params: body, as: :json
    response_session = JSON.parse(response.body, symbolize_names: true)
    csrf = response_session[:data][:attributes][:csrf_token]
    @headers_1 = { "X-CSRF-Token": csrf }
  end

  it 'can create a still' do
    body = {
      film_still: {
        description: "Alec post gunshot",
        film_epk_id: @epk.id
      }
    }

    post "/api/v1/film_stills", headers: @headers_1, params: body, as: :json

    expect(response).to be_successful
    expect(response.status).to eq(200)

    film_still = JSON.parse(response.body, symbolize_names: true)

    expect(film_still).to have_key(:data)
    expect(film_still[:data]).to be_a(Hash)
    expect(film_still[:data].keys.count).to eq(3)
    expect(film_still[:data]).to have_key(:id)
    expect(film_still[:data][:id]).to be_a(String)
    expect(film_still[:data]).to have_key(:type)
    expect(film_still[:data][:type]).to eq("film_stills")
    expect(film_still[:data]).to have_key(:attributes)
    expect(film_still[:data][:attributes]).to be_a(Hash)
    expect(film_still[:data][:attributes].keys.count).to eq(3)
    expect(film_still[:data][:attributes]).to have_key(:description)
    expect(film_still[:data][:attributes][:description]).to be_a(String)
    expect(film_still[:data][:attributes]).to have_key(:film_epk_id)
    expect(film_still[:data][:attributes][:film_epk_id]).to eq(@epk.id)
    expect(film_still[:data][:attributes]).to have_key(:film_still_url)
    expect(film_still[:data][:attributes][:film_still_url]).to eq(nil)
  end

  # it 'can update a film epk' do
  #   body = {
  #     film_fam: {
  #       id: @ff.id,
  #       role: "dir3ctor",
  #       first_name: "Action",
  #       last_name: "Bronson",
  #       description: "momma smurfs",
  #       film_epk_id: @epk.id
  #     }
  #   }

  #   patch "/api/v1/film_fams/#{@ff.id}", headers: @headers_1, params: body, as: :json

  #   expect(response).to be_successful
  #   expect(response.status).to eq(200)

  #   updated_film_fam = JSON.parse(response.body, symbolize_names: true)

  #   updated_role = updated_film_fam[:data][:attributes][:role]
  #   updated_first_name = updated_film_fam[:data][:attributes][:first_name]
  #   updated_last_name = updated_film_fam[:data][:attributes][:last_name]
  #   updated_description = updated_film_fam[:data][:attributes][:description]

  #   expect(updated_role).to_not eq(@ff.role)
  #   expect(updated_first_name).to_not eq(@ff.first_name)
  #   expect(updated_last_name).to_not eq(@ff.last_name)
  #   expect(updated_description).to_not eq(@ff.description)
  # end

  # it 'returns an error with invalid epk id' do
  #   body = {
  #     film_fam: {
  #       role: "Actor",
  #       first_name: "Alec",
  #       last_name: "Baldwin",
  #       description: "poppa smurfs",
  #       film_epk_id: 420
  #     }
  #   }

  #   post "/api/v1/film_fams", headers: @headers_1, params: body, as: :json

  #   expect(response).to_not be_successful
  #   expect(response.status).to eq(404)

  #   error_response = JSON.parse(response.body, symbolize_names: true)

  #   error_message = { error: "An existing Film Epk id is required" }
  #   expect(error_response).to eq(error_message)
  # end

  # it "returns all film fam records for a given Film Epk" do
  #   get "/api/v1/film_epk/#{@epk.id}/film_fams"

  #   expect(response).to be_successful
  #   expect(response.status).to eq(200)
  #   award_info = JSON.parse(response.body, symbolize_names: true)

  #   expect(award_info).to have_key(:data)
  #   expect(award_info[:data]).to be_an(Array)
  #   expect(award_info[:data].count).to eq(1)
  # end

  # describe "delete" do
  #   it "can delete a film fam" do
  #     delete "/api/v1/film_fams/#{@ff.id}", headers: @headers_1, params: body, as: :json

  #     expect(response).to be_successful
  #     expect(response.status).to eq(204)
  #     expect(FilmFam.all).to eq([])
  #   end

  #   it "can't delete a film fam that doesn't exist" do
  #     delete "/api/v1/film_fams/420", headers: @headers_1, params: body, as: :json

  #     expect(response).to_not be_successful
  #     expect(response.status).to eq(404)
  #     expect(FilmFam.all).to eq([@ff])
  #   end
  # end
end
