require_relative '../spec_helper'

describe "When a user visits '/films'" do
  it "they see a welcome message" do
    visit('/films')
    within("h1:nth-of-type(1)") do
      expect(page).to have_content("Hello!")
    end
  end
end
