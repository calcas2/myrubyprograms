def trova(file = ARGV.first, word = ARGV[1], new_file = ARGV.last)
file_in_string = File.read(file)
r_in_array = file_in_string.scan(/^\d+\. [^\b#]*/)
File.open(new_file, "w") do |file|
r_in_array.each do |result|
file.puts result if result.include?(word)
end
end
end

def length_array(file = ARGV.first)
file_in_string = File.read(file)
r_in_array = file_in_string.scan(/^\d+\. [^\b#]*/).length
end

puts length_array
trova
 #must be 500 quizzes

#formula da applicare:
