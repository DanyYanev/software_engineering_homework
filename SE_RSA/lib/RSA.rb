require "prime"

class RSA
   def initialize n, e, d
     #initializes this instance of RSA with a n,e and d variables of type int. 'n','e' are the public key and 'd' is the private one. This n,e,d should be used when encrypting and decrypting the message
     @n = n
     @e = e
     @d = d
   end

   def n
      #returns the value of 'n' passed in the initialize
      @n
   end

   def e
       @e
      #returns the value of 'e' passed in the initialize
   end

   def d
       @d
      #returns the value of 'd' passed in the initialize
   end

   def self.new_key
       #generates a new 'n','e' and 'd' values following the RSA algorithm. Returns a new array of three elements where the first element is 'n', the second is 'e' and the third is 'd'. Each time it is called a new key must be returned.
       random_number = Random.new
       p = (Prime.first 120)[10 + random_number.rand(110)]
       q = (Prime.first 120)[10 + random_number.rand(110)]
       until p != q do
           q = (Prime.first 120)[10 + random_number.rand(110)]
       end

       n = p * q

       coprime = Array.new

       lcm = (p - 1).lcm(q - 1)
       for i in 2..lcm
           if i.gcd(lcm) == 1
               coprime << i
           end
       end
       e = coprime[random_number.rand(coprime.size)]
       d = 0

       for i in 2..lcm
           if ((i * e) % lcm) == 1
               d = i
               break
           end
       end

       keys = [n, e, d]
       return keys
   end


   def encrypt msg
      #encrypts the message passed. The message is of type string. Encrypts each symbol of this string by using its ASCII number representation and returns the encrypted message
      encrypted_msg = String.new

      msg.each_char do |ch|
          o = (ch.ord) ** e % n
          encrypted_msg << o.to_s
          encrypted_msg << "," if ch != msg[-1]
      end

      encrypted_msg
   end

   def decrypt msg
      #decrypts the message passed. The message is of type string. Decrypts each symbol of this string Encrypts each symbol of this string by using its ASCII number representationand returns the decrypted message.

      decrypted_msg = String.new

      msg.split(',').each do |ch|
          o = ( (ch.to_i) ** @d) % @n
          decrypted_msg << o
      end

      decrypted_msg
   end
end
