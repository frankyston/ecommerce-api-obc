# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::V1::Coupons as :client', type: :request do
  let(:user) { create(:user, profile: :client) }

  context 'GET /coupons' do
    let(:url) { '/admin/v1/coupons' }
    let!(:coupons) { create_list(:coupon, 5) }
    before(:each) { get url, headers: auth_header(user) }
    include_examples 'forbidden access'
  end

  context 'POST /coupons' do
    let(:url) { '/admin/v1/coupons' }
    before(:each) { get url, headers: auth_header(user) }
    include_examples 'forbidden access'
  end

  context 'PATCH /coupons/:id' do
    let(:coupon) { create(:coupon) }
    let(:url) { "/admin/v1/coupons/#{coupon.id}" }
    before(:each) { get url, headers: auth_header(user) }
    include_examples 'forbidden access'
  end

  context 'DELETE /coupons/:id' do
    let!(:coupon) { create(:coupon) }
    let(:url) { "/admin/v1/coupons/#{coupon.id}" }
    before(:each) { get url, headers: auth_header(user) }
    include_examples 'forbidden access'
  end
end
