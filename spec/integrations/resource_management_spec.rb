  require 'spec_helper'

  feature "Resources Page Management", js: true do

    let(:user) { FactoryGirl.create(:user) }
    let(:stone) { FactoryGirl.create(:stone) }
    let(:resource) { FactoryGirl.create(:resource) }

    before(:each) do
      stone.resources << resource
      visit stone_path(stone)
    end

    scenario "User Visits Resources Page" do
      click_link("Resources")
      expect(page).to have_content(resource.title)
    end  

    scenario "User Visits Resources Page And Can Add a Resource" do
      click_link("Resources")

      fill_in('Title', :with => 'Poodr')
      fill_in('Description', :with => 'What the FUCK AM I DOING!')
      fill_in('Url', :with => 'http://www.soccernet.com')
      fill_in('Recommended time', :with => 600)

      page.find(:css,'.submit_button input').click

      expect(page).to have_content("Poodr")
    end

  end