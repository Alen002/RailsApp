require 'rails_helper' #Always declare this for every spec

describe Product do #Start of describe

  context "when the product has comments" do #Start of context
    let(:product) {Product.create!(name: "race bike")}
    let(:user) {User.create!(email:" John.Doe@hello.com", password: "hellothere")}

    before do #Sets comments up before the test starts
      product.comments.create!(rating: 1, user: user, body: "Awful bike")
      product.comments.create!(rating: 3, user: user, body: "OK bike")
      product.comments.create!(rating: 5, user: user, body: "Great bike")
    end

    it "returns the average rating of all comments" do #Run the test (=spec)
      expect(product.average_rating).to eq 3
    end

    it "is not valid without a name" do
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end

  end #/End of context

end #/End of describe
