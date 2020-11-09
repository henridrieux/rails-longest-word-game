require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letter = {}
    @letter = ('a'..'z').to_a.sample(10)
  end

  def englishWord(word)
  url = "https://wagon-dictionary.herokuapp.com/autocomplete/#{word}"
  list = JSON.parse(open(url).read)
  return word.include? list
  end

  def score
    keyword = params[:score]
    englishWord(keyword)
  end
end
