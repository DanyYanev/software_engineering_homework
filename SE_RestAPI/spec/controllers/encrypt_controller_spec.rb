RSpec.describe EncryptController do

    before :all do
        @rsa = Rsa.new(mid: "123", n: 46883, e: 3439, d: 18919)
        @rsa.save
    end

    it "encrypt a missing message" do
        get :encrypt_msg, params: {id: 1} #get request for show method with id 1
        expect(response).to render_template :not_found
        #expect(response).to have_http_status 200
    end

    it "encrypt a proper message" do
        post :encrypt_msg, params: {id: "123", message: "alabala"}
        #expect(response). to have_http_status 200
        expect(response.body).to match("123")
    end

    it "encrypt and return a message" do
        get :show, params: {id: "123"}
        expect(response).to have_http_status 200
    end

end
