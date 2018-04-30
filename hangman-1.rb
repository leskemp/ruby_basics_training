#!/usr/local/bin/ruby -w

TESTING = true

wrong = 0

alph_arr = ("a".."z").to_a

# default guess word is "wicked" unless an argument is included
secret = "wicked"
secret = ARGV.join(" ") unless ARGV[0].empty?

puts "#{secret} is the secret" if TESTING

guessed = ''

len = secret.length
underscore_arr = Array.new(len, "_")

while (wrong < 3) && (guessed != secret)
  puts "Hangman Secret Word"
  puts underscore_arr.join('')
  puts "Press 'Y' to see remaining letters: "
  y = STDIN.gets.chomp
  puts y = "Y" || y = "y" ? alph_arr
  puts "You have #{3-wrong} lives remaining"

  # input a guess, if the length is 1, search for matches, else compare directly
  # to Secret
  puts "Enter your guess (letter or full word): "
  guessed = STDIN.gets.chomp
  guess_len = guessed.length

  if guessed_len == 1
    #find all occurances of guess in secret
    underscore_arr.each_with_index { |elm,idx|
      # update the array to  if element == letter
      alph_arr[idx] = guessed if elm == guessed
      right = true
    }

    # if there's no match, increment wrong
    wrong ++ if !right
    # if this an option? --> !right ? wrong++
  else

  end

  # update underscore_arr if guess is correct.
  #Output underscore_arr
  # "press enter to continue"
  # clear the screen

end

puts wrong == 3 ? "You Lose" : "You Win"
