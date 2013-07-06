require "getoptlong"
require "./easy"
require "./medium"
require "./difficult"

module Settings

def self.start
username = level = ""
opts = GetoptLong.new(
[ "--username", "-u", GetoptLong::REQUIRED_ARGUMENT ],
[ "--level", "-l", GetoptLong::REQUIRED_ARGUMENT ]
)
opts.each do |opt, arg|
case opt
when "--username"
username = arg
when "--level"
level = arg
end
end
Settings.check(level, username)
end

def self.check(level, username)
if level == "easy" 
Easy::MathGame.new(username, score = 0).play
elsif level == "medium"
Medium::MathGame.new(username, score = 0).play
elsif level == "difficult"
Difficult::MathGame.new(username, score = 0).play
else
puts "unknown value"
abort("you have to choose between 'easy', 'medium', 'difficult'")
end
end
end


Settings.start

