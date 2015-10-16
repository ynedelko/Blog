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

  it "produces and error if fields are left blank" do
    visit new_post_path
    click_on 'Create Post'
    expect(page).to have_content 'Errors'
  end
end

describe "updating a post process" do
  it "edits an existing post" do
    post = Post.create(:title => "Not So Great Day", :text => "This and this happened")
    visit post_path(post)
    click_on 'Edit Post'
    fill_in 'Title', :with => 'Very Great Day'
    click_on 'Update Post'
    expect(page).to have_content 'Very Great Day'
  end
end
