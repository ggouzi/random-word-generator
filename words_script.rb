#!/usr/bin/ruby
require_relative 'utils'

if ARGV.length!=3
  puts "Need to have three params: Language, type and number of words to generate"
  puts "Example: ruby words_script.rb ES names 10"
  exit
end

number = ARGV[2].to_i
if ARGV[2].to_i.to_s!=number.to_s
	puts "Cannot parse "+ARGV[2]+" in a number"
	exit
end

language = ARGV[0]
type = ARGV[1]

if (type!="words" && type!="names")
	puts "type parameter should be equal to 'words' or 'names'"
	exit
end

if(type=="names")
	language=language+"-"+type
end
filename = "words/"+language+".dic"

if (!File.file?(filename))
	puts "Can't find "+filename
	exit
end


def generateListWords(filename, n)
	hash = getOccurences(filename)
	i=0
	until i==n
		word = generateWord(hash)
		if word.length >= MIN_LENGTH_WORD
			i=i+1
			puts word
		end
	end
end

generateListWords(filename, number)

