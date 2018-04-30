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
  y = STDIN.gets.chomp #if input is 'Y' do next line
  puts y = "Y" || y = "y" ? alph_arr

  # If wrong > 0 output how many lives they have left (3-wrong)

  # input a guess

  # update underscore_arr if guess is correct.
  #Output underscore_arr
  # "press enter to continue"
  # clear the screen

end

puts wrong == 3 ? "You Lose" : "You Win"
