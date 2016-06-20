require "rails_helper"

describe Post, type: :model do
  it "has a valid factory" do
    post = create(:post)
    expect(post).to  be_valid
  end

  it "is invalid without a content" do
    post = build(:post, content: nil)
    expect(post).not_to  be_valid
  end

  it "is invalid without a title"  do
    post = build(:post, title: nil)
    expect(post).not_to  be_valid
  end

end
