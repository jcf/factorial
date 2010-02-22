# Author: James Conroy-Finn
def factorial(number)
  (1..number).inject { |memo, num| memo * num }
end

