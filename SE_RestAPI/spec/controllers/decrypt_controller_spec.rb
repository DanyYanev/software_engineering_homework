RSpec.describe DecryptController do

    before :all do
        @rsa = Rsa.new(mid: "123", n: 46883, e: 3439, d: 18919, enc_message: "6406,26654,44626,44626,24965,34886,29282,27083")
        @rsa.save
    end

    it "decrypt with missing rsa" do
        post :decrypt_msg, params: {id: 1} #get request for show method with id 1
        expect(response).to render_template :not_found
        #expect(response).to have_http_status 200
    end

    it "decrypt a proper message" do

        post :decrypt_msg, params: {id: "123", message: @rsa.enc_message}
        expect(response.body).to match("hello123")
    end
    
end
