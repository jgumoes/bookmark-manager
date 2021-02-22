
feature "bookmarks" do
  scenario "view bookmarks" do
    visit('/bookmarks')
    expect(page).to have_content "https://www.pictureofhotdog.com/about"
    expect(page).not_to have_content "Sinatra"
  end
end