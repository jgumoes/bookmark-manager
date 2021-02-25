
feature "adding bookmarks" do
  scenario "add bookmark" do
    connection = PG.connect(dbname: 'bookmarks_manager_test')
    visit('/new')
    fill_in('url', with: "https://www.pictureofhotdog.com/about")
    fill_in('title', with: "Picture of Hot Dog")
    click_on("Add Bookmark")

    visit('/bookmarks')
    expect(page).to have_link("Picture of Hot Dog", href: "https://www.pictureofhotdog.com/about")
  end
  
end