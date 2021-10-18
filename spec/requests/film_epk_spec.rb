require 'rails_helper'

RSpec.describe 'movie details API' do
  it 'returns the user credentials after a succesfull login', :vcr do
   user =  User.create!(
      email: "whatever@example.com",
      first_name: "First",
      last_name: "Last",
      password: "password",
      password_confirmation: "password"
    )

    body = {
      title: 'Gangsta Squirrel Dragons Attack the Scrumdillyuptious Hippopotamus',
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

    post '/api/v1/film_epk', params: body, as: :json

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
    expect(movie_detail[:data][:attributes].keys.count).to eq(11)
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

  describe "upload movie poster" do
    xit "updates the film_epk record with a movie_poster_url", :vcr do
      user =  User.create!(
         email: "whatever@example.com",
         first_name: "First",
         last_name: "Last",
         password: "password",
         password_confirmation: "password"
       )

      epk = FilmEpk.create!(
        user_id: user.id,
        movie_title: "The Best"
      )

      body1 = {
        file: {
               filename: "test_upload",
               byte_size: 92358,
               checksum: "UCo4+JMJDVuxmSASPcz+Wg==",
               content_type: "image/jpeg",
               metadata: {
               message: "active_storage_test"
              }
        }
      }

      post '/api/v1/presigned_url', params: body1, as: :json
      response_body1 = JSON.parse(response.body, symbolize_names: true)

      body2 = File.binread('spec/assets/amazing_grace_movie_poster.jpg')
      headers2 = {
        "Content-MD5": response_body1[:direct_upload][:headers][:"Content-MD5"],
        "Content-Type": response_body1[:direct_upload][:headers][:"Content-Type"]
      }
# direct_upload url changes each time the post '/api/v1/presigned_url' is called - need to be static. stub?
      Faraday.put(response_body1[:direct_upload][:url]) do |f|
        f.body = body2
        f.headers = headers2
      end

      body3 = {
                movie_poster: "#{response_body1[:blob_signed_id]}"
              }

      patch "/api/v1/film_epk/#{epk.id}", params: body3, as: :json
      response_body3 = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(response_body3).to have_key(:id)
      expect(response_body3[:id]).to eq(epk.id)
      expect(response_body3).to have_key(:user_id)
      expect(response_body3[:user_id]).to eq(user.id)
      expect(response_body3).to have_key(:movie_poster_url)
      expect(response_body3[:movie_poster_url]).to be_a(String)
    end
  end
end
