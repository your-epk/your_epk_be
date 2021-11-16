require 'rails_helper'

RSpec.describe 'movie details API' do
  before :each do
    @user =  User.create!(
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

     body = {
      email: "whatever@example.com",
      password: "password",

    }

    post '/api/v1/sessions', params: body, as: :json
    response_session = JSON.parse(response.body, symbolize_names: true)
    @csrf = response_session[:data][:attributes][:csrf_token]
    @headers_1 = { "X-CSRF-Token": @csrf }
  end

  it 'creates a film epk' do
    body = {
      movie_title: 'Gangsta Squirrel Dragons Attack the Scrumdillyuptious Hippopotamus',
      user_id: @user.id,
     }

    post '/api/v1/film_epk', headers: @headers_1, params: body, as: :json

    expect(response).to be_successful
    expect(response.status).to eq(200)

    movie_detail = JSON.parse(response.body, symbolize_names: true)

    expect(movie_detail).to have_key(:data)
    expect(movie_detail[:data]).to be_a(Hash)
    expect(movie_detail[:data].keys.count).to eq(4)
    expect(movie_detail[:data]).to have_key(:id)
    expect(movie_detail[:data][:id]).to be_a(String)
    expect(movie_detail[:data]).to have_key(:type)
    expect(movie_detail[:data][:type]).to eq("film_epk")
    expect(movie_detail[:data]).to have_key(:attributes)
    expect(movie_detail[:data][:attributes]).to be_a(Hash)
    expect(movie_detail[:data][:attributes].keys.count).to eq(23)
    expect(movie_detail[:data][:attributes]).to have_key(:user_id)
    expect(movie_detail[:data][:attributes][:user_id]).to eq(@user.id)
    expect(movie_detail[:data][:attributes]).to have_key(:genre)
    expect(movie_detail[:data][:attributes][:genre]).to eq(nil)
    expect(movie_detail[:data][:attributes]).to have_key(:country)
    expect(movie_detail[:data][:attributes][:country]).to eq(nil)
    expect(movie_detail[:data][:attributes]).to have_key(:release_year)
    expect(movie_detail[:data][:attributes][:release_year]).to eq(nil)
    expect(movie_detail[:data][:attributes]).to have_key(:run_time)
    expect(movie_detail[:data][:attributes][:run_time]).to eq(nil)
    expect(movie_detail[:data][:attributes]).to have_key(:language)
    expect(movie_detail[:data][:attributes][:language]).to eq(nil)
    expect(movie_detail[:data][:attributes]).to have_key(:budget)
    expect(movie_detail[:data][:attributes][:budget]).to eq(nil)
    expect(movie_detail[:data][:attributes]).to have_key(:website)
    expect(movie_detail[:data][:attributes][:website]).to eq(nil)
    expect(movie_detail[:data][:attributes]).to have_key(:production_company)
    expect(movie_detail[:data][:attributes][:production_company]).to eq(nil)
    expect(movie_detail[:data][:attributes]).to have_key(:distribution)
    expect(movie_detail[:data][:attributes][:distribution]).to eq(nil)
  end

  it 'returns an error if fields not filled out correctly' do
    body = {
      title: 'Gangsta Squirrel Dragons Attack the Scrumdillyuptious Hippopotamus',
      user_id: nil,
     }

    post '/api/v1/film_epk', headers: @headers_1, params: body, as: :json

    expect(response).to_not be_successful
    expect(response.status).to eq(404)

    response_body = JSON.parse(response.body, symbolize_names: true)
    error_message = { error: "Please Fill In required Fields" }
    expect(response_body).to eq(error_message)
  end

  it 'updates an existing film epk records attributes' do
    body = {
      movie_title: 'Gangsta Squirrel Dragons Attack the Scrumdillyuptious Hippopotamus',
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

    patch "/api/v1/film_epk/#{@epk.id}", headers: @headers_1, params: body, as: :json

    expect(response).to be_successful
    expect(response.status).to eq(200)

    movie_detail = JSON.parse(response.body, symbolize_names: true)

    expect(movie_detail).to have_key(:data)
    expect(movie_detail[:data]).to be_a(Hash)
    expect(movie_detail[:data].keys.count).to eq(4)
    expect(movie_detail[:data]).to have_key(:id)
    expect(movie_detail[:data][:id]).to be_a(String)
    expect(movie_detail[:data]).to have_key(:type)
    expect(movie_detail[:data][:type]).to eq("film_epk")
    expect(movie_detail[:data]).to have_key(:attributes)
    expect(movie_detail[:data][:attributes]).to be_a(Hash)
    expect(movie_detail[:data][:attributes].keys.count).to eq(23)
    expect(movie_detail[:data][:attributes]).to have_key(:user_id)
    expect(movie_detail[:data][:attributes][:user_id]).to eq(@user.id)
    expect(movie_detail[:data][:attributes]).to have_key(:genre)
    expect(movie_detail[:data][:attributes][:genre]).to be_a(String)
    expect(movie_detail[:data][:attributes]).to have_key(:country)
    expect(movie_detail[:data][:attributes][:country]).to be_a(String)
    expect(movie_detail[:data][:attributes]).to have_key(:release_year)
    expect(movie_detail[:data][:attributes][:release_year]).to be_a(String)
    expect(movie_detail[:data][:attributes]).to have_key(:run_time)
    expect(movie_detail[:data][:attributes][:run_time]).to be_a(String)
    expect(movie_detail[:data][:attributes]).to have_key(:language)
    expect(movie_detail[:data][:attributes][:language]).to be_a(String)
    expect(movie_detail[:data][:attributes]).to have_key(:budget)
    expect(movie_detail[:data][:attributes][:budget]).to be_a(String)
    expect(movie_detail[:data][:attributes]).to have_key(:website)
    expect(movie_detail[:data][:attributes][:website]).to be_a(String)
    expect(movie_detail[:data][:attributes]).to have_key(:production_company)
    expect(movie_detail[:data][:attributes][:production_company]).to be_a(String)
    expect(movie_detail[:data][:attributes]).to have_key(:distribution)
    expect(movie_detail[:data][:attributes][:distribution]).to be_a(String)
  end

  it "displays a film epk record's attributes and relationships by film epk id" do
    get "/api/v1/film_epk/#{@epk.id}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    film_epk = JSON.parse(response.body, symbolize_names: true)

    expect(film_epk).to have_key(:data)
    expect(film_epk[:data]).to be_a(Hash)
    expect(film_epk[:data].keys.count).to eq(4)
    expect(film_epk[:data]).to have_key(:id)
    expect(film_epk[:data][:id]).to be_a(String)
    expect(film_epk[:data]).to have_key(:type)
    expect(film_epk[:data][:type]).to eq("film_epk")
    expect(film_epk[:data]).to have_key(:attributes)
    expect(film_epk[:data][:attributes]).to be_a(Hash)
    expect(film_epk[:data][:attributes].keys.count).to eq(23)
    expect(film_epk[:data][:attributes]).to have_key(:user_id)
    expect(film_epk[:data][:attributes][:user_id]).to eq(@user.id)
    expect(film_epk[:data][:attributes]).to have_key(:genre)
    expect(film_epk[:data][:attributes][:genre]).to eq(nil)
    expect(film_epk[:data][:attributes]).to have_key(:country)
    expect(film_epk[:data][:attributes][:country]).to eq(nil)
    expect(film_epk[:data][:attributes]).to have_key(:release_year)
    expect(film_epk[:data][:attributes][:release_year]).to eq(nil)
    expect(film_epk[:data][:attributes]).to have_key(:run_time)
    expect(film_epk[:data][:attributes][:run_time]).to eq(nil)
    expect(film_epk[:data][:attributes]).to have_key(:language)
    expect(film_epk[:data][:attributes][:language]).to eq(nil)
    expect(film_epk[:data][:attributes]).to have_key(:budget)
    expect(film_epk[:data][:attributes][:budget]).to eq(nil)
    expect(film_epk[:data][:attributes]).to have_key(:website)
    expect(film_epk[:data][:attributes][:website]).to eq(nil)
    expect(film_epk[:data][:attributes]).to have_key(:production_company)
    expect(film_epk[:data][:attributes][:production_company]).to eq(nil)
    expect(film_epk[:data][:attributes]).to have_key(:distribution)
    expect(film_epk[:data][:attributes][:distribution]).to eq(nil)
  end

  it "deletes a film epk record and it's dependents" do
    # award = Award.create!(film_epk_id: @epk.id)
    press = Press.create!(film_epk_id: @epk.id)
    film_fam = FilmFam.create!(film_epk_id: @epk.id)

    delete "/api/v1/film_epk/#{@epk.id}", headers: @headers_1, params: body, as: :json

    expect(response).to be_successful
    expect(response.status).to eq(204)
    # expect(FilmEpk.all).to eq([])
    expect(Award.all).to eq([])
    expect(Press.all).to eq([])
    expect(FilmFam.all).to eq([])
  end
end
