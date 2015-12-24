require 'spec_helper'

describe Spree::ProductsController, type: :controller do
  stub_authorization!

  describe 'google_merchant' do
    let!(:product) { create(:product, available_on: 1.year.ago) }
    let(:user) { create(:user) }

    before do
      allow(controller).to receive(:current_spree_user).and_return(user)
    end

    it 'sets the right instance variable' do
      spree_get :google_merchant, format: :rss

      expect(assigns(:items)).not_to be_nil
      expect(assigns(:items).first).to eq(product)
    end

    it 'renders the proper RSS template' do
      spree_get :google_merchant, format: :rss

      expect(response).to be_success
      expect(response.content_type).to eq("application/rss+xml")
      expect(response).to render_template("spree/products/google_merchant")
    end
  end
end
