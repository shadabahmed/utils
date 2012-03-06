class Primes
  # Initialize list of primes with 2
  @@primes = [2]
  @@current_prime = 1
  
  # Reset the prime number generator
  def self.reset
    @@current_prime = 1
  end  

  # Get the next prime number in sequence
  def self.next
    # Iterate the current prime with 1 and keep incrementing until prime is found
    @@current_prime += 1
    until is_prime?(@@current_prime)
      @@current_prime += 1
    end
    @@primes << @@current_prime
    @@current_prime
  end
  
  private
  # Find a number is prime
  def self.is_prime?(num)
    # Iteration only required till the root of the number.
    # There will be atleast one small factor < sqrt(num) if it is composite
    max_num = Math.sqrt(num)
    # Iterate over already calculated primes and find if any smaller prime divides the number
    @@primes.each do|i|
      break if i > max_num
      return false if num % i == 0
    end
    true
  end
end

1000000.times do
  puts Primes.next
end



