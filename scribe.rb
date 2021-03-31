#######################################################
#####  Example of the pen and the scribe, part 2  #####
#######################################################

  # recreating a pen object (not from a class)
  pen = Object.new

  def pen.write(words)
    puts words
  end

  # now create a scribe class who will actually use the pen object we created
  class Scribe 
    def initialize pen
      # a scribe needs almost by definition a pen, quill, etc.
      @pen = pen  
      # a list of items we want the scribe to record
      @list = Array.new 
    end
    
    # Getters and setters manually...
    # def list
    #   @list
    # end
    # 
    # def pen
    #   @pen
    # end
    
    # def pen=(pen)
    #   @pen = pen
    # end
    
    # the easy way in Ruby... (same results as above)
    attr_reader :list
    attr_accessor :pen

    def note item
      # when we tell the scribe to make a note, he/she adds it to the list
      @list << item
    end
    
    def write_everything
      # when we want to see all the items in the list
      @list.each{ |item| @pen.write item }
    end
  end
  
  # one of the most famous scribes in the O.T. was Ezra 
  # (and the only one I can think of right now), so ...
  puts "Creating Ezra... \n"
  ezra = Scribe.new pen
  # let's verify that Ezra has the pen object we've created
  p ezra.pen
  
  # time for Ezra to make some notes; first will be the time itself
  ezra.note "The time is #{Time.now}"
  # verify that the note is on the list
  p ezra.list
  
  # one more note for good measure
  ezra.note "Time to read the Law to the people"
  
  # now print it all out with the pen
  ezra.write_everything
  
  # # ## OUTPUT:
  # # # >> The time is 2018-03-06 12:37:03 -0400
  # # # >> Time to read the Law to the people
  
  
  # time for another break in the action
  puts Array.new(20, "-").join
  puts
  # follow-up on previous ideas...
  # adding a method to just the ezra object
  def ezra.speak_hebrew
    puts "Hallelujah"
  end
  
  ezra.speak_hebrew
  
  # creating a new scribe who is not Jewish
  puts Array.new(20, "-").join
  puts "Creating Hammurabi..."
  hammurabi = Scribe.new(pen)
  puts hammurabi.pen
  # hammurabi.respond_to? :note          # => true
  # hammurabi.respond_to? :speak_hebrew  # => false
  # # since Babylonians don't speak hebrew ...
  puts hammurabi.speak_hebrew    # ... will fail
  