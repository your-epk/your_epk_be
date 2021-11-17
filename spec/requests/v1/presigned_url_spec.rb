require 'rails_helper'

RSpec.describe 'presigned url API' do
  it 'returns upload link and blob_signed_id', :vcr do
    user = User.create!(
      email: "whatever@example.com",
      first_name: "First",
      last_name: "Last",
      password: "password",
      password_confirmation: "password"
    )

    body1 = {
      email: "Whatever@example.com",
      password: "password"
    }

    post '/api/v1/sessions', params: body1, as: :json
    response_session = JSON.parse(response.body, symbolize_names: true)
    csrf = response_session[:data][:attributes][:csrf_token]
    @headers_1 = { "X-CSRF-Token": csrf }

    body2 = {
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

    post '/api/v1/presigned_url', headers: @headers_1, params: body2, as: :json

    expect(response).to be_successful
    expect(response.status).to eq(200)

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body).to have_key(:direct_upload)
    expect(response_body[:direct_upload]).to be_a(Hash)
    expect(response_body[:direct_upload].keys.count).to eq(2)
    expect(response_body[:direct_upload]).to have_key(:url)
    expect(response_body[:direct_upload][:url]).to be_a(String)
    expect(response_body[:direct_upload]).to have_key(:headers)
    expect(response_body[:direct_upload][:headers]).to be_a(Hash)
    expect(response_body[:direct_upload][:headers].keys.count).to eq(2)
    expect(response_body[:direct_upload][:headers]).to have_key(:"Content-Type")
    expect(response_body[:direct_upload][:headers][:"Content-Type"]).to eq("image/jpeg")
    expect(response_body[:direct_upload][:headers]).to have_key(:"Content-MD5")
    expect(response_body[:direct_upload][:headers][:"Content-Type"]).to be_a(String)
    expect(response_body).to have_key(:blob_signed_id)
    expect(response_body[:blob_signed_id]).to be_a(String)
  end
end
