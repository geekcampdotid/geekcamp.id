require 'rails_helper'

feature "CFP Flow" do

  scenario "Visitors can navigate to the CFP page" do
    visit home_path

    click_link "Submit A Talk"
    expect(page.current_path).to eq(cfp_path)

    click_link "Submit your talk"
    expect(page.current_path).to eq(new_cfp_path)
  end


end
