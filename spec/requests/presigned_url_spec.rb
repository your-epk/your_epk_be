require 'rails_helper'

RSpec.describe 'presigned url API' do
  it 'returns the user credentials after a succesfull login', :vcr do

  body = {
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

    post '/api/v1/presigned_url', params: body, as: :json

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
