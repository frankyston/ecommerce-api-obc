require 'rails_helper'

describe "Home", type: :request do
  let(:user) { create(:user) }

  it "should response Hello World!" do
    get '/admin/v1/home', headers: auth_header(user)
    expect(body_json).to eq({ 'message' => 'Hello World!' })
  end

  it 'should response with status :ok' do
    get '/admin/v1/home', headers: auth_header(user)
    expect(response).to have_http_status(:ok)
  end
end
