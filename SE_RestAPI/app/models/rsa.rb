require 'prime'
class Rsa < ApplicationRecord

    def encrypt msg
        encrypted_msg = String.new

        msg.each_char do |ch|
            o = (ch.ord) ** e % n
            encrypted_msg << o.to_s
            encrypted_msg << "," if ch != msg[-1]
        end

        encrypted_msg
    end

    def decrypt msg
        decrypted_msg = String.new

        msg.split(',').each do |ch|
            o = ( (ch.to_i) ** d) % n
            decrypted_msg << o
        end

        decrypted_msg
    end


    def self.new_keys
		p = generatePrime

        begin q = generatePrime
        end while q == p

		n = p * q

		fn = (p - 1) * (q - 1)
		e = rand(1..fn)

		while haveCommonDividors(e, fn) == true
			e = rand(1..fn)
		end

		for d in 1..fn
			if( (d * e) - 1) % fn == 0
				break
			end
		end

		result = Array.new
		result << n
		result << e
		result << d

		result
    end

    def self.haveCommonDividors(arg1, arg2)
		(2..arg1).each do |num|
			return true if arg1 % num == 0 and arg2 % num == 0
		end
		return false
	end

	def self.generatePrime
		Prime.take(rand(2..2**7))[-1]
    end
end
