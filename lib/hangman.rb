class Hangman
  attr_reader(:foodtype)
  define_method(:initialize) do
    @foodtypes = ['chapati madondo', 'pizza', 'hamburger', 'omelette', 'githeri', 'ugali collards']
    @foodtype=@foodtypes[rand(0...((@foodtypes.length)-1))]
    @positiontoreplace=[]
  end
  define_method(:check_letter) do |inputletter|
    "chapati".split(" ").each() do |word|
      word.split("").each() do |letter|
        if inputletter==letter
          @positiontoreplace.push(word.split("").index(letter))
        end
      end
    end
  end

  define_method(:replace_hyphens) do |inputletter, fb|
    check_letter(inputletter)
    fb=fb.gsub(/\s+/,"")
    harray=fb.split("")
    @positiontoreplace.each() do |position|
      harray[position]=inputletter
    end
    harray
  end
end
