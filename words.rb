#!/usr/bin/ruby

language = ARGV[0]
filename = "words/"+language+".dic"
resultFile = "occurences/occurences_"+language+".txt"

if (!File.file?(filename))
	puts "Can't find "+filename
	exit 0
end


def getOccurences(filepath)
	nextChar = Hash.new(0)
	File.open(filepath, :encoding => 'UTF-8') do |f|
		while line = f.gets
			line.insert(0, '^')
			arr = line.downcase.gsub(/\n|\r\n/, '~').split("").each_cons(2).map(&:join)
			arr.each do |pair|
				nextChar[pair] += 1
			end
		end
	end
	return nextChar.sort_by {|k,v| v}.reverse.to_h
end

def getWordsByMatch(filepath, str)
	result = Array.new
	File.open(filepath, :encoding => 'UTF-8') do |f|
		while line = f.gets
			if line.downcase.gsub(/\n|\r\n/, '~').include? str
			   result.push(line)
			end
		end
	end
	return result
end

def percentageRepartition(hash)
	total = hash.values.sum
	percentages = hash.transform_values { |v| (v * 100.0 / total).round(4) }
	return percentages
end

def percentageCumulativeRepartition(hash)
	sum = 0
	total = hash.values.sum
	percentages = hash.transform_values { |v| (sum+=(v * 100.0 / total)) }
	return percentages
end

def selectChar(hash, previousChar)
	filteredPossibilities = hash.select{|key, value| key[0]==previousChar}
	b = percentageRepartition(filteredPossibilities)
	a = weighted_rand(b)
	return a[1]
end


def weighted_rand(weights = {})
  #raise 'Probabilities must sum up to 1' unless weights.values.inject(&:+) == 1.0

  u = 0.0
  ranges = Hash[weights.map{ |v, p| [u += p, v] }]

  u = rand(0...100)
  ranges.find{ |p, _| p > u }.last
end

def generateWord(hash, length)
	resultStr = ""
	# Select the ending possibility first
	previousChar = '^'
	nextChar = ""
	while nextChar!='~' do
	#for i in (1..length-1)
		nextChar = selectChar(hash, previousChar)
		puts nextChar
		resultStr.concat(nextChar)
		previousChar = nextChar
	end

	return resultStr
end


hash = getOccurences(filename)
puts generateWord(hash, 6)

#puts getWordsByMatch(filename, "q~")
