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
    expect(film_fam[:data][:attributes].keys.count).to eq(5)
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