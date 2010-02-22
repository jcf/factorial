# Author: James Conroy-Finn
module Math
  def self.factorial(f)
    f == 0 ? 1 : f * factorial(f - 1)
  end
end

