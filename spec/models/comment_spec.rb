require 'rails_helper'

describe Comment do
  it {should validate_presence_of :text}
  it {should validate_presence_of :public_name}
  it {should belong_to :post}
  it {should belong_to :user}
end
