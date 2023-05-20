require 'colorize'

class Output
  def string(string = "", color = :default, spacing = "")
    return if string == ""
    spacer if spacing == :pad || spacing == :before
    puts string.colorize(color)
    spacer if spacing == :pad || spacing == :after
  end
  
  def header(string)
    string("====== #{string} ======", :red, :before)
  end
  
  def spacer
    puts "\n"
  end
end
