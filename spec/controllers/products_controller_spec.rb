require 'rails_helper'


describe ProductsController, type: :controller  do  #Start of Products Controller


  #index
  context "index" do
    it "renders the index template" do
      get :index
      expect(response).to be_ok
      expect(response).to render_template("index")
    end
  end # End of index


  #delete
  context "delete" do
    before do
      @product = FactoryBot.create(:product)
      @user = FactoryBot.create(:user)
      sign_in @user
    end
    it "allows admin to delete a product" do
      delete :destroy, params: {id: @product}
      expect(response).to redirect_to products_path
    end
  end # /End of delete


  #update
    context "put #update" do
      before do
        @product = FactoryBot.create(:product)
        @user = FactoryBot.create(:user)
        sign_in @user
      end
      it "successfully updates a product" do
        @update = { name:@product.name, image_url:"image.org", id:@product.id, price:@product.price, colour: "red"}
        put :update, params: { id: @product.id, product: @update}
        @product.reload
        expect(@product.colour).to eq "red"
      end
    end # /End of update



    #Create
      context "POST #create" do
        before do
          @user = FactoryBot.build(:user)
          sign_in @user
        end
        it "successfully creates new product" do  
          @product = FactoryBot.create(:product)
          expect(response).to be_successful
        end
        it "cannot create a product" do
           expect(Product.new(price:nil)).not_to be_valid
        end
      end  #/Endo f create



end #/End of ProductsController
