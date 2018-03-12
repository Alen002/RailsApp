require 'rails_helper'

describe Comment do
  context "Comments checking" do

    it "not valid w/o rating" do
      expect(Comment.new(rating:nil)).not_to be_valid
    end

    it "not valid w/o text" do
      expect(Comment.new(body:nil)).not_to be_valid
    end

    it "not valid w/o user_id" do
      expect(Comment.new(user_id:nil)).not_to be_valid
    end

  end
end
