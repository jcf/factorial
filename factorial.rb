# Author: James Conroy-Finn
module Math
  def self.factorial(f)
    f == 0 ? 1 : f * factorial(f - 1)
  end
end

# Or we can extend an instance of Fixnum so we can do 5.factorial :)
class Fixnum
  def factorial
    self == 0 ? 1 : self * (self - 1).factorial
  end
end

