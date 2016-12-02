 describe "When a user visits the new film path" do
    it "they can create a new film" do
      visit('/films/new')

      fill_in 'film[title]', with: "Avatar"
      fill_in 'film[year]', with: 2004
      fill_in 'film[box_office_sales]', with: 3
      fill_in 'film[genre]', with: "Action" 
      fill_in 'film[director]', with: "James Cameron"

      click_on 'Submit'


      avatar = Film.find_by(title: "Avatar")
      
      expect(current_path).to eq ("/films")
      expect(page).to have_content("#{avatar.title}")

  end
end