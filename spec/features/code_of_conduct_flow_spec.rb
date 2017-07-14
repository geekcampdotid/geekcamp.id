require 'rails_helper'

feature "Code of Conduct Flow" do

  scenario "Visitors can navigate to the Code of Conduct page" do
    visit home_path
    click_link "Kode Etik"
    expect(page.current_path).to eq(kode_etik_path)

    visit home_path
    click_link "Code of Conduct"
    expect(page.current_path).to eq(code_of_conduct_path)
  end


end
