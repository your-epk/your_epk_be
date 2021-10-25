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
  end

  it 'creates a film epk' do
    body = {
      title: 'Gangsta Squirrel Dragons Attack the Scrumdillyuptious Hippopotamus',
      user_id: @user.id,
     }

    post '/api/v1/film_epk', params: body, as: :json

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

    patch "/api/v1/film_epk/#{@epk.id}", params: body, as: :json

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

    delete "/api/v1/film_epk/#{@epk.id}"

    expect(response).to be_successful
    expect(response.status).to eq(204)
    expect(FilmEpk.all).to eq([])
    expect(Award.all).to eq([])
    expect(Press.all).to eq([])
    expect(FilmFam.all).to eq([])
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

  describe "create film_fam" do
    xit "creates an associated film fam record" do
      body = {
        film_epk: {
          film_fam: {
            role: "Director",
            first_name: "Harry",
            last_name: "Parabols",
            description: "Runs this shit",
          }
        }
      }

      patch "/api/v1/film_epk/#{@epk.id}", params: body, as: :json

      expect(response).to be_successful
      expect(response.status).to eq(200)
      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to have_key(:data)
      expect(response_body[:data]).to be_a(Hash)
      expect(response_body[:data].keys.count).to eq(4)
      expect(response_body[:data]).to have_key(:id)
      expect(response_body[:data][:id]).to eq(@epk.id.to_s)
      expect(response_body[:data]).to have_key(:type)
      expect(response_body[:data][:type]).to eq("film_epk")
      expect(response_body[:data]).to have_key(:attributes)
      expect(response_body[:data][:attributes]).to be_a(Hash)
      expect(response_body[:data][:attributes].keys.count).to eq(15)
      expect(response_body[:data][:attributes]).to have_key(:film_fams)
      expect(response_body[:data][:attributes][:film_fams]).to be_an(Array)

      ff = response_body[:data][:attributes][:film_fams]

      expect(ff.first[:role]).to eq(body[:film_epk][:film_fam][:role])
      expect(ff.first[:first_name]).to eq(body[:film_epk][:film_fam][:first_name])
      expect(ff.first[:last_name]).to eq(body[:film_epk][:film_fam][:last_name])
    end
  end
end
