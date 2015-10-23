require 'rails_helper'

describe "adding a comment process" do
  it "adds a new comment" do
    visit new_user_registration_path
    fill_in 'Email', :with =>"name@email.com"
    fill_in 'Password', :with => "notpassword"
    fill_in 'Password confirmation', :with => "notpassword"
    click_on 'Sign up'
    expect(page).to have_content('All Posts')
  end
end
