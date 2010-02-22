# Author: James Conroy-Finn
class Fixnum
  def factorial
    self == 0 ? 1 : self * (self - 1).factorial
  end
end

