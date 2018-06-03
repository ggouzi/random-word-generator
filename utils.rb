#!/usr/bin/ruby

DELIMITER_BEGIN='^'
DELIMITER_END='$'
MIN_LENGTH_WORD=4

def getOccurences(filepath)
	nextChar = Hash.new(0)
	File.open(filepath, :encoding => 'UTF-8') do |f|
		while line = f.gets
			line.insert(0, DELIMITER_BEGIN)
			# Replace line ending chars and generate possible combinations of 3 consecutive chars
			arr = line.downcase.gsub(/\n|\r\n/, DELIMITER_END).split("").each_cons(3).map(&:join)
			arr.each do |pair|
				nextChar[pair] += 1
			end
		end
	end
	return nextChar.sort_by {|k,v| v}.reverse.to_h
end

def selectNextChar(hash, a, b)
	filteredPossibilities = hash.select{|key, value| key[0]==a && key[1]==b}
	selectedTriplet = selectTriplet(filteredPossibilities)
	return selectedTriplet[2]
end

def selectFirstChars(hash)
	filteredPossibilities = hash.select{|key, value| key[0]==DELIMITER_BEGIN}
	selectedTriplet = selectTriplet(filteredPossibilities)
	return selectedTriplet[1]+selectedTriplet[2]
end

def selectTriplet(weights)
	unless weights!={} 
		return DELIMITER_END*4 
	end
	sum = 0
	total = weights.values.sum
	ranges = weights.transform_values { |v| (sum+=(v * 100.0 / total)) }

	u = rand(0...100)
	ranges.find{ |_, p| p > u }.first
end

def generateWord(hash)
	resultStr = selectFirstChars(hash)
	previousPChar = resultStr[0]
	previousChar = resultStr[1]
	nextChar = ''

	until nextChar==DELIMITER_END
		resultStr.concat(nextChar)
		nextChar = selectNextChar(hash, previousPChar, previousChar)
		previousPChar = previousChar
		previousChar = nextChar
	end

	return resultStr
end
