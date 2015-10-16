require 'rails_helper'

describe "adding a post process" do
  it "adds a new post" do
    visit posts_path
    click_on 'Add New Post'
    fill_in 'Title', :with => 'Today was a Good Day'
    fill_in 'Text', :with => 'Today was a good day because these good things happened.'
    click_on 'Create Post'
    expect(page).to have_content 'Today was a Good Day'
  end
end
