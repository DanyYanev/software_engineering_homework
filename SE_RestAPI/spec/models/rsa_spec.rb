require_relative "../../app/models/rsa"
RSpec.describe Rsa do
    it "encrypts" do
        @rsa = Rsa.new

        n, e, d = Rsa.new_keys

        @rsa.n = n
        @rsa.e = e
        @rsa.d = d

        expect(@rsa.encrypt("hello123")).to_not eq "hello123"
    end

    it "decrypts" do
        @rsa = Rsa.new

        n, e, d = Rsa.new_keys

        @rsa.n = n
        @rsa.e = e
        @rsa.d = d

        expect(@rsa.decrypt(@rsa.encrypt("hello123"))).to eq "hello123"
    end

    it "generates keys" do
        n, e, d = nil
        n, e, d = Rsa.new_keys

        expect(n && e && d).to_not eq nil
    end
end
