require "timeout"

module Parent
attr_accessor :user
def initialize(username, score)
@user = Player.new(username, score)
@myarr = %w{+ - * /}
@life = 3
end

%w{+ - * /}.each do |meth|
if meth == "/"
define_method(meth) do
max = (1..@random_no)
list = []
max.to_a.each do |n|
list << n if @random_no % n == 0
end
@random_no2 = list[rand(list.length)]
end
else
define_method(meth) do
@random_no2 = rand(@random_no)
end
end
end
class Player 
attr_accessor :score
attr_reader :username
def initialize(username, score)
@username, @score = username, score
end
end

end
