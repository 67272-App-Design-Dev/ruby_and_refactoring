# Simple method format purposes
def brk
  puts "============================"
end

# # Finding all symbols and symbol methods
symbols = Symbol.all_symbols.sort{|x,y| x.to_s <=> y.to_s }
symbols.each { |x| print x.to_s + "\t" }
brk

# Strings and Symbols
puts "duck"           # this is a string
puts :"duck"          # the : converts the string to a symbol 
puts :duck            # since it is so common, Ruby let's us drop the quotation marks
puts "duck".to_sym    # this is a string converted to a symbol with .to_sym method
puts %s[goose]        # %s[goose].class # => Symbol
brk
# 
# 
# Adding more symbols to the symbols table
:mallard
:ring_neck

# Adding methods also creates symbols
def quack
  puts "quack"
end

# Adding classes (and their associated methods) adds more symbols
class Duck
  attr_accessor :breed, :gender
  def walk
    puts "waddle"
  end
end


# Difference between strings and symbols
puts "favorite".object_id.to_s
puts "favorite".object_id.to_s
puts "favorite".object_id.to_s
brk
puts :favorite.object_id.to_s
puts :favorite.object_id.to_s
puts :favorite.object_id.to_s
brk

# # Symbols are faster than strings
require 'benchmark'
str_time = Benchmark.measure { for i in 1..10_000_000; duck = "mallard" end}
sym_time = Benchmark.measure { for i in 1..10_000_000; duck = :mallard end}

puts str_time.format("[String] Total CPU time: %t")
puts sym_time.format("[Symbol] Total CPU time: %t")
puts "Ratio str/sym: #{str_time.total.to_f/sym_time.total.to_f}"
brk

# ### BOTTOM LINE: Symbols are immutable strings that take less memory 
# ### and are faster to implement than strings.
