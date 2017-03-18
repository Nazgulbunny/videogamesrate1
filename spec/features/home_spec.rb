require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached only by authenticated users' do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)

      visit root_path

      expect(page.status_code).to eq(200)
      expect(page).to have_content(/Update Status/)
    end
  end

  describe 'front' do
    it 'can be reached only by guest users' do
      visit root_path

      expect(page.status_code).to eq(200)
      expect(page).to have_content(/NEWSFEED/)
    end
  end
end