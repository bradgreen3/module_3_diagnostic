require 'rails_helper'
require 'launchy'

describe "user visits root page" do
  context "and fills in form" do
    it "they are redirected to the search page" do
      visit '/'
      fill_in("q", :with => '80203')
      click_on 'Locate'

      expect(current_path).to eq('/search')
      expect(current_url).to have_content("80203")
    end
  end
end
