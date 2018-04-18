RSpec.describe RsasController do

    it "shows an rsa" do
        get :show, params: {id: 1} #get request for show method with id 1
        expect(response).to render_template :show
    end

    it "creates a new rsa with given params" do
        expect {
            post :create, params: {n:5, e:7, d:3}
        }.to change { Rsa.count }.by(1)
    end

    it "creates a new rsa without given params" do
        expect {
            post :create
        }.to change { Rsa.count }.by(1)
    end
end
