#!/usr/bin/ruby

language = ARGV[0]
filename = "words/"+language+".dic"
resultFile = "occurences/occurences_"+language+".txt"
MAX_LENGTH = 10

if (!File.file?(filename))
	puts "Can't find "+filename
	exit 0
end


def getOccurences(filepath)
	nextChar = Hash.new(0)
	File.open(filepath, :encoding => 'UTF-8') do |f|
		while line = f.gets
			line.insert(0, '^')
			arr = line.downcase.gsub(/\n|\r\n/, '~').split("").each_cons(3).map(&:join)
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

def selectChar3(hash, a, b)
	filteredPossibilities = hash.select{|key, value| key[0]==a && key[1]==b}
	b = percentageRepartition(filteredPossibilities)
	a = weighted_rand(b)
	return a[2]
end

def selectChar(hash)
	filteredPossibilities = hash.select{|key, value| key[0]=='^'}
	b = percentageRepartition(filteredPossibilities)
	a = weighted_rand(b)
	return a[1]+a[2]
end

def weighted_rand(weights)
  #raise 'Probabilities must sum up to 1' unless weights.values.inject(&:+) == 1.0

  u = 0.0
  ranges = percentageCumulativeRepartition(weights)
  if weights == {}
  	return "~~~~"
  end

  u = rand(0...100)
  ranges.find{ |_, p| p > u }.first
end

def generateWord(hash)
	resultStr = ""
	# Select the ending possibility first
	resultStr = selectChar(hash)
	previousPChar = resultStr[0]
	previousChar = resultStr[1]

	nextChar = ''
	while (true) do
	#for i in (1..length-1)
		nextChar = selectChar3(hash, previousPChar, previousChar)
		if (nextChar=='~')
			break
		end
		resultStr.concat(nextChar)
		previousChar = nextChar
		previousPChar = previousChar
	end



	return resultStr
end


hash = getOccurences(filename)
for i in 1..20
puts generateWord(hash)
end

#puts getWordsByMatch(filename, "q~")
