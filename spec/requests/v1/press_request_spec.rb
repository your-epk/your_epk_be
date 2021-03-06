require 'rails_helper'

RSpec.describe 'presses API' do
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

    @press = Press.create!(
      film_epk_id: @epk.id,
      name_of_publication: "The Good One",
      description: "We extra good",
      link: "www.thegoodone.com",
    )

    body = {
      email: "Whatever@example.com",
      password: "password",

    }

    post '/api/v1/sessions', params: body, as: :json
    response_session = JSON.parse(response.body, symbolize_names: true)
    @csrf = response_session[:data][:attributes][:csrf_token]
    @headers_1 = { "X-CSRF-Token": @csrf }
  end

  it 'creates a flim epk press record' do
    body = {
        press: {
          name_of_publication: "The Paper",
          description: "We real good",
          link: "www.thepaper.com",
          film_epk_id: @epk.id
        }
    }

    post "/api/v1/presses", headers: @headers_1, params: body, as: :json

    expect(response).to be_successful
    expect(response.status).to eq(200)
    press_response = JSON.parse(response.body, symbolize_names: true)

    expect(press_response).to have_key(:data)
    expect(press_response[:data]).to be_a(Hash)
    expect(press_response[:data].keys.count).to eq(3)
    expect(press_response[:data]).to have_key(:id)
    expect(press_response[:data][:id]).to be_a(String)
    expect(press_response[:data]).to have_key(:type)
    expect(press_response[:data][:type]).to eq("press")
    expect(press_response[:data]).to have_key(:attributes)
    expect(press_response[:data][:attributes]).to be_a(Hash)
    expect(press_response[:data][:attributes].keys.count).to eq(4)
    expect(press_response[:data][:attributes]).to have_key(:name_of_publication)
    expect(press_response[:data][:attributes][:name_of_publication]).to be_a(String)
    expect(press_response[:data][:attributes]).to have_key(:description)
    expect(press_response[:data][:attributes][:description]).to be_a(String)
    expect(press_response[:data][:attributes]).to have_key(:link)
    expect(press_response[:data][:attributes][:link]).to be_a(String)
    expect(press_response[:data][:attributes]).to have_key(:film_epk_id)
    expect(press_response[:data][:attributes][:film_epk_id]).to eq(@epk.id)
  end

  it "returns all press records for a given Film Epk" do
    get "/api/v1/film_epk/#{@epk.id}/presses"

    expect(response).to be_successful
    expect(response.status).to eq(200)
    award_info = JSON.parse(response.body, symbolize_names: true)

    expect(award_info).to have_key(:data)
    expect(award_info[:data]).to be_an(Array)
    expect(award_info[:data].count).to eq(1)
  end

  it 'return error with invalid epk id' do
    body = {
      press: {
        name_of_publication: "The Paper",
        description: "We real good",
        link: "www.thepaper.com"
      }
  }

  post "/api/v1/presses", headers: @headers_1, params: body, as: :json

  expect(response).to_not be_successful
  expect(response.status).to eq(404)

  error_response = JSON.parse(response.body, symbolize_names: true)

  error_message = { error: "An existing Film Epk id is required" }
  expect(error_response).to eq(error_message)
  end

  describe "delete" do
    it "deletes an award record by id" do
      delete "/api/v1/presses/#{@press.id}", headers: @headers_1, params: body, as: :json

      expect(response).to be_successful
      expect(response.status).to eq(204)
      expect(Press.all).to eq([])
    end

    it "returns an error if a delete is attempted for an award that doesn't exist" do
      delete "/api/v1/presses/27", headers: @headers_1, params: body, as: :json

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
      response_body = JSON.parse(response.body, symbolize_names: true)

      error_message = { error: "Press record does not exist" }

      expect(response_body).to eq(error_message)
    end
  end
end
