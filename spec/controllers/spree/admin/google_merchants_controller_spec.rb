require 'spec_helper'

describe Spree::Admin::GoogleMerchantsController, type: :controller do
  stub_authorization!

  describe 'update' do
    it 'sets Spree::GoogleMerchant::Config to a preferences hash' do
      spree_put :update, preferences: {
        google_merchant_title: 'title',
        google_merchant_description: 'description',
        production_domain: 'domain'
      }, format: :html

      expect(response).to redirect_to spree.admin_google_merchants_path

      expect(Spree::GoogleMerchant::Config.google_merchant_title).to eq('title')
      expect(Spree::GoogleMerchant::Config.google_merchant_description).to eq('description')
      expect(Spree::GoogleMerchant::Config.production_domain).to eq('domain')
    end
  end
end
