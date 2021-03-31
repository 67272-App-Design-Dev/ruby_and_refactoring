# Examples: looking at classes and ancestors
5.class                     # => Integer
5.class.ancestors           # => [Integer, Numeric, Comparable, Object, Kernel, BasicObject]

"Quack".class               # => String
"Quack".class.ancestors     # => [String, Comparable, Object, Kernel, BasicObject]

[1,2,3].class               # => Array
[1,2,3].class.ancestors     # => [Array, Enumerable, Object, Kernel, BasicObject]

d = class Duck; self; end;  # making a quick class
daffy = Duck.new            # making an instance of that class
d.class                     # => Class
d.class.ancestors           # => [Class, Module, Object, Kernel, BasicObject]
daffy.class                 # => Duck
daffy.class.ancestors       # => [Duck, Object, Kernel, BasicObject]


# Note that everything -- integers, arrays, strings, classes -- are part of Object
5.kind_of? Object           # => true
"Quack".kind_of? Object     # => true
[1,2,3].kind_of? Object     # => true
d.is_a? Object              # => true
daffy.is_a? Object          # => true
# --------------------
daffy.instance_of? Duck     # => true
daffy.instance_of? Object   # => false

# Object receive messages
"quack".send :upcase        # => "QUACK"
5.send :+, 9                # => 14
[1,2,3].send :nil?          # => false
d.send :class               # => Class
daffy.send :class           # => Duck

# Object responds to messages
"quack".respond_to? :length # => true
5.respond_to? :+            # => true
