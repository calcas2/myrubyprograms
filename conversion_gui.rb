require 'tk'

class Conversion

    def from_celsius_to_fahrenheit(value)
     value_to_convert = value.to_f
     value_converted = "%.2f" % ((9/5 * value_to_convert) + 32)
     "value to convert: #{value_to_convert}, value converted in fahrenheit: #{value_converted}"
    end
    
    def from_fahrenheit_to_celsius(value)
	value_to_convert = value.to_f
	value_converted = "%.2f" % ((value_to_convert − 32) / 1.8)
	 "value to convert: #{value_to_convert}, value converted in celsius: #{value_converted}"
    end



  def convert
   value, units = @text.value.split
   case units
   when /cf/i
   $val.value = from_celsius_to_fahrenheit(value)
   when /fc/i
   $val.value = from_fahrenheit_to_celsius(value)
   else
   $val.value = "unknown conversion"
   end
   end

  def initialize
    ph = { 'padx' => 10, 'pady' => 10 }     # common options
    p = proc {convert}
    $val = TkVariable.new
    @text = TkVariable.new
    root = TkRoot.new { title "Conversion" }
    top = TkFrame.new(root)
    TkLabel.new(top) {
      text   "type the value you want to convert followed by the space(' ') and 'cf' if you want to convert from Celsius to Fahrenheit or by 'fc' if you want to convert from Fahrenheit to Celsius"
     pack(ph) }
    @entry = TkEntry.new(top, 'textvariable' => @text)
    @entry.pack(ph)
    TkButton.new(top) {text 'Convert it!';  command p; pack ph}
    TkButton.new(top) {text 'Exit'; command {proc exit}; pack ph}
    top.pack('fill'=>'both', 'side' =>'top')
    $lbl = TkLabel.new(root) do
  textvariable
  borderwidth 5
  font TkFont.new('times 20 bold')
  foreground  "red"
  relief      "groove"
  pack("side" => "right",  "padx"=> "50", "pady"=> "50")
end
$lbl['textvariable'] = $val
  end
end

Conversion.new
Tk.mainloop

