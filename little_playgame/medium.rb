require "./general"

module Medium

class MathGame
include Parent
def analyze(value)
if value.to_i == @random_no.send(@operator, @random_no2)
@user.score += 30
puts "correct!"
else
@life -= 1
puts "uncorrect. the right answer is: #{@random_no.send("#{@operator}", @random_no2)}"
end
end

def play
loop do
@random_no = rand(1..30)
@operator = @myarr[rand(4)]
self.send(@operator)
begin
Timeout::timeout(5) do
puts "#{@random_no} #{@operator} #{@random_no2}"
input = gets
self.analyze(input)
end
rescue
@life -= 1
puts "too slow!"
end
break if @life == 0
end
puts "total score for #{@user.username}: #{@user.score}"
end
end
end

