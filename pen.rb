#######################################################
#####  Example of the pen and the scribe, part 1  #####
#######################################################

  # create a pen object
  pen = Object.new      # => #<Object:0x007f8f3c0ca378>
  pen.is_a? Object      # => true
  pen.is_a? Class       # => false
  
  # add a method to the pen
  def pen.to_s          # !> previous definition of to_s existed and we are overwriting it
    "A trusty pen"
  end
  # see that this method works as expected
  pen.send :to_s        # => "A trusty pen"
  pen.to_s              # => "A trusty pen"
  pen                   # => A trusty pen (the to_s method served as the object's name now)
  
  # let's start writing with our pen...
  # pen.write "nunqeh Terran" 
  ## => NoMethodError: undefined method `write' for A trusty pen:Object
  
  # fine, then let's add a method to this pen object so it can write
  def pen.write(words)
    puts words
  end
  
  pen.write "nunqeh Terran" 
  # => nil >> nunqeh Terran
  pen.write pen             
  # => nil >> A trusty pen
  
  # let's make the pen a blue ink pen (b/c blue is an awesome color...)
  # pen.ink_color = "Blue"  
  ## => NoMethodError: undefined method `ink_color' for A trusty pen:Object
  
  # okay, let's define the method ink_color for the pen object
  def pen.ink_color=(color)
    @ink_color = color
  end
  
  # now set the color to blue
  pen.ink_color = "Blue"    # => "Blue"
  
  # let's update to_s to add in the color
  def pen.to_s              # !> method redefined; discarding old to_s
    "A trusty #{@ink_color.downcase} pen" 
  end
  
  # verify that it works
  p pen.send :to_s            # => "A trusty blue pen"
  
  # writing a method that adds 'sparkles' to words to demo implicit receivers
  def pen.sparkly_write words
    write "*;. #{words} *;.*" # note the implicit receiver
  end
  
  pen.sparkly_write "Sparkles! (sort of)"  
  ## => nil >> *;. Sparkles! (sort of) *;.*
  pen.sparkly_write pen                    
  ## => nil >> *;. A trusty blue pen *;.*
  
  # create a method to write html
  def pen.html_write words
    if @ink_color
      write "<p style=\"color: #{@ink_color.downcase};\">#{words}</p>"
      # sorry for adding the color style right in the p tag but works for a demo...
    else
      write "<p>#{words}</p>"
    end 
  end
  
  # now try this method out...
  pen.html_write "Sorry Lizzie for the embedded style" 
  # => nil >> <p style="color: Blue;">Sorry Lizzie for the embedded style</p>
  

  # creating a clone of an object
  pen2 = pen.clone
  pen2.write("Matt")
  
  puts pen.object_id
  puts pen2.object_id  # different object id
