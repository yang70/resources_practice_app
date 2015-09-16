require "test_helper"

feature "RootPathIsTeamIndex" do
  scenario "visit root path, see list of teams" do
    visit root_path
    page.must_have_content "Teams"
  end
end
