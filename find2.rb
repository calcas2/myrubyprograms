def trova(file = ARGV.first, word = ARGV[1], new_file = ARGV.last)
file_in_string = File.read(file)
r_in_array = file_in_string.scan(/^\d+\. .*\b#{Regexp.escape(word)}.*\.\#$/m)
File.open(new_file, "w") do |file|
r_in_array.each do |result|
file.puts result
end
end
end

trova

#formula da applicare:
