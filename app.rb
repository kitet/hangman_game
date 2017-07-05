require "sinatra"
require "sinatra/reloader"
require "./lib/hangman.rb"
also_reload('lib/**/*.rb')

get ('/') do
  hangman=Hangman.new
  # @foodtype=(hangman.foodtype()).gsub(/[[:alpha:]]/, "_ ")
  @array=("chapati").split(" ")
  @genericarray=[]
  @array.each() do |word|
    @genericarray.push(word.gsub(/[[:alpha:]]/,"_ "))
  end
  @foodtype=@genericarray.join("***")
  erb :index
end

post '/' do
  hangman=Hangman.new
  @letter=params.fetch('letter')
  @fb="_ _ _ _ _ _ _ "
  @foodtype=hangman.replace_hyphens(@letter,@fb)
  erb :index
end
