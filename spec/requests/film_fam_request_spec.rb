require 'rails_helper'

RSpec.describe 'film fam API' do
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
  end 

  it 'can create a film fam' do
    body = {
      film_fam: { 
        role: "Actor",
        first_name: "Alec",
        last_name: "Baldwin",
        description: "poppa smurfs",
        film_epk_id: @epk.id 
      }
    }

    post "/api/v1/film_fams", params: body, as: :json

    expect(response).to be_successful
    expect(response.status).to eq(200)

    film_fam = JSON.parse(response.body, symbolize_names: true)

    expect(film_fam).to have_key(:data)
    expect(film_fam[:data]).to be_a(Hash)
    expect(film_fam[:data].keys.count).to eq(3)
    expect(film_fam[:data]).to have_key(:id)
    expect(film_fam[:data][:id]).to be_a(String)
    expect(film_fam[:data]).to have_key(:type)
    expect(film_fam[:data][:type]).to eq("film_fam")
    expect(film_fam[:data]).to have_key(:attributes)
    expect(film_fam[:data][:attributes]).to be_a(Hash)
    expect(film_fam[:data][:attributes].keys.count).to eq(6)
    expect(film_fam[:data][:attributes]).to have_key(:role)
    expect(film_fam[:data][:attributes][:role]).to be_a(String)
    expect(film_fam[:data][:attributes]).to have_key(:first_name)
    expect(film_fam[:data][:attributes][:first_name]).to be_a(String)
    expect(film_fam[:data][:attributes]).to have_key(:last_name)
    expect(film_fam[:data][:attributes][:last_name]).to be_a(String)
    expect(film_fam[:data][:attributes]).to have_key(:description)
    expect(film_fam[:data][:attributes][:description]).to be_a(String)
    expect(film_fam[:data][:attributes]).to have_key(:film_epk_id)
    expect(film_fam[:data][:attributes][:film_epk_id]).to eq(@epk.id)
  end 

  it 'can update a film epk' do 
    body = {
      film_fam: { 
        id: @ff.id,
        role: "dir3ctor",
        first_name: "Action",
        last_name: "Bronson",
        description: "momma smurfs",
        film_epk_id: @epk.id 
      }
    }

    patch "/api/v1/film_fams/#{@ff.id}", params: body, as: :json

    expect(response).to be_successful
    expect(response.status).to eq(200)

    updated_film_fam = JSON.parse(response.body, symbolize_names: true)

    updated_role = updated_film_fam[:data][:attributes][:role]
    updated_first_name = updated_film_fam[:data][:attributes][:first_name]
    updated_last_name = updated_film_fam[:data][:attributes][:last_name]
    updated_description = updated_film_fam[:data][:attributes][:description]

    expect(updated_role).to_not eq(@ff.role)
    expect(updated_first_name).to_not eq(@ff.first_name)
    expect(updated_last_name).to_not eq(@ff.last_name)
    expect(updated_description).to_not eq(@ff.description)
  end 

  it 'returns an error with invalid epk id' do
    body = {
      film_fam: { 
        role: "Actor",
        first_name: "Alec",
        last_name: "Baldwin",
        description: "poppa smurfs",
        film_epk_id: 420
      }
    }

    post "/api/v1/film_fams", params: body, as: :json

    expect(response).to_not be_successful
    expect(response.status).to eq(404)

    error_response = JSON.parse(response.body, symbolize_names: true)

    error_message = { error: "An existing Film Epk id is required" }
    expect(error_response).to eq(error_message)
  end 

  it "returns all film fam records for a given Film Epk" do
    get "/api/v1/film_epk/#{@epk.id}/film_fams"

    expect(response).to be_successful
    expect(response.status).to eq(200)
    award_info = JSON.parse(response.body, symbolize_names: true)

    expect(award_info).to have_key(:data)
    expect(award_info[:data]).to be_an(Array)
    expect(award_info[:data].count).to eq(1)
  end

  describe "delete" do
    it "can delete a film fam" do
      delete "/api/v1/film_fams/#{@ff.id}"

      expect(response).to be_successful
      expect(response.status).to eq(204)
      expect(FilmFam.all).to eq([])
    end 

    it "can't delete a film fam that doesn't exist" do
      delete "/api/v1/film_fams/420"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
      expect(FilmFam.all).to eq([@ff])
    end
  end 
end