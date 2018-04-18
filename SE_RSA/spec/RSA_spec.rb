# require_relative "../../app/models/rsa"
require "RSA"
RSpec.describe RSA do
    it "encrypts" do
        # @rsa = RSA.new

        n, e, d = RSA.new_key

        @rsa = RSA.new(n, e, d)

        expect(@rsa.encrypt("hello123")).to_not eq "hello123"
    end

    it "decrypts" do
        # @rsa = RSA.new

        n, e, d = RSA.new_key

        @rsa = RSA.new(n, e, d)

        expect(@rsa.decrypt(@rsa.encrypt("hello123"))).to eq "hello123"
    end

    it "generates keys" do
        n, e, d = RSA.new_key

        expect(n && e && d).to_not eq nil
    end

    it "returns n" do
        @rsa = RSA.new(1, 3, 5)

        expect(@rsa.n).to eq 1
    end

    it "return e" do
        @rsa = RSA.new(1, 3, 5)

        expect(@rsa.e). to eq 3
    end

    it "return d" do
        @rsa = RSA.new(1, 3, 5)

        expect(@rsa.d). to eq 5
    end
end
