require 'rails_helper'
require 'launchy'

describe "user visits root page" do
  context "and fills in form" do
    it "they are redirected to the search page" do
      visit '/'
      fill_in('Zip', :with => '80203')
      click_on 'Locate'

      expect(current_path).to eq('/search')
    end
  end
end
