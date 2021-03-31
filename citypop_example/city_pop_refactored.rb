#city_pop_refactored.rb

# ===============================
# Objective: to read a file listing the city, state and
# population of the largest cities in the U.S.  For a 
# given state, a list of large cities (in alphabetical 
# order) is produced along with their respective 
# populations.  If there are no large cities in that 
# state, an informative message should notify the user.


#  ... to be completed as a class exercise
  







## RUNNING THE CODE...

pop1 = Population.new
pop1.state = "CA"
pop1.get_pop
puts        
pop1.get_pop("TX")
puts        
pop1.get_pop("PA")
puts        
pop1.get_pop("NC")
puts
pop1.get_pop("NH")
puts "---------------------------------"
puts ""
pop1.population_file=("citypop_1900.txt")
pop1.peek_into_file
puts
pop1.get_pop("PA")
puts
pop1.state = "NC"
pop1.get_pop
puts "---------------------------------"
puts ""
pop2 = Population.new("citypop_1900.txt")
pop2.get_pop("CA")
puts
pop2.get_pop("AK")
