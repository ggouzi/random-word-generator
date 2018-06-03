require 'sinatra/base'
require_relative 'utils'

PORT = 3000

class ExifApi < Sinatra::Base
  set :port, PORT

  before do
    content_type :json
  end

  get '/generate' do
    type = params[:type]
    language = params[:language]
    number = params[:number].to_i
    if (type=="names")
      language=language+"-names"
    end
    begin
      arr = generateListWords("words/"+language+".dic", number)
      result = arr.to_json
    rescue Exception => e
      puts e.message
      status 500
      createJsonBody(500, "Internal server error: Unable to load main page", true).to_json
    end
  end

end

def generateListWords(filename, n)
  hash = getOccurences(filename)
  arr=Array.new
  until arr.length==n
    word = generateWord(hash)
    if word.length >= MIN_LENGTH_WORD
      arr.push(word)
      puts word
    end
  end
  return arr
end



def createJsonBody(status, message, error)
  return {:status => status, :error => true, :message => message}
end

