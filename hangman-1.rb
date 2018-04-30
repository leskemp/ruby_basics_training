#!/usr/local/bin/ruby -w

# initialising vars
TESTING = true
wrong = 0
alph_arr = ("a".."z").to_a
guessed = ''

# default guess word is "wicked" unless an argument is included
secret = "wicked"
secret = ARGV.join(" ") unless ARGV[0].empty?

puts "#{secret} is the secret" if TESTING

len = secret.length
underscore_arr = Array.new(len, "_")

puts "Welcome to Hangman"

while (wrong < 3) && (underscore_arr.join('') != secret)
  # initialise right on each turn
  right = false

  puts "Hangman Secret Word"
  puts underscore_arr.join('')
  puts "Press 'Y' to see remaining letters: "
  y = STDIN.gets.chomp
  puts y = "Y" || y = "y" ? alph_arr
  puts "You have #{3-wrong} lives remaining"

  puts "What is your guess: "
  guessed = STDIN.getch

  #find all occurances of guess in secret
  underscore_arr.each_with_index { |elm,idx|
    # update the array to  if element == letter
    alph_arr[idx] = guessed if elm == guessed
    right = true
  }

  # if there's no match, increment wrong
  wrong++ if !right
  # is this an option? --> !right ? wrong++

  right ? puts "Correct guess" : puts "Incorrect. #{3-wrong} lives left"
  puts "any key to continue"
  STDIN.getch
  # clear the screen
  system "clear"
end

puts wrong == 3 ? "You Lose" : "You Win"
