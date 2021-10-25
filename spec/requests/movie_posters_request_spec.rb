require 'rails_helper'

RSpec.describe 'movie posters API' do
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

  xit 'links a blob_signed_id to a film epk', :vcr do
    # body1 = {
    #   file: {
    #          filename: "test_upload",
    #          byte_size: 92358,
    #          checksum: "UCo4+JMJDVuxmSASPcz+Wg==",
    #          content_type: "image/jpeg",
    #          metadata: {
    #          message: "active_storage_test"
    #         }
    #   }
    # }

    # post '/api/v1/presigned_url', params: body1, as: :json
    # response_body1 = JSON.parse(response.body, symbolize_names: true)

    body2 = File.binread('spec/assets/amazing_grace_movie_poster.jpg')
    headers2 = {
      "Content-Type": "image/jpeg",
            "Content-MD5": "UCo4+JMJDVuxmSASPcz+Wg=="
    }
# direct_upload url changes each time the post '/api/v1/presigned_url' is called - need to be static. stub?
    Faraday.put("https://your-epk-development.s3.us-west-2.amazonaws.com/uploads/80b77a77-e7f2-4e47-b22a-c8280ae032d3?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVGNANJEWSXY6YYDD%2F20211025%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211025T230547Z&X-Amz-Expires=600&X-Amz-SignedHeaders=content-length%3Bcontent-md5%3Bcontent-type%3Bhost&X-Amz-Signature=3e6cd14eae823a8edee7a12c23f0da473e4e1ca207bd3495035c1ecabf94c08e") do |f|
      f.body = body2
      f.headers = headers2
    end

    body3 = {
      film_epk_id: @epk.id,
      blob_signed_id: "eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBEZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--8dc4d32d74dbc0cb2637a87b9d631295cec13138"
    }

    post '/api/v1/movie_posters', params: body3, as: :json

    expect(response).to be_successful
    expect(response.status).to eq(200)

    movie_poster = JSON.parse(response.body, symbolize_names: true)
  end
end
