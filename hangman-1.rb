#!/usr/local/bin/ruby -w

require 'io/console'

# initialising vars
TESTING = true
wrong = 0
alph_arr = ("a".."z").to_a
guessed = ''

# default guess word is "wicked" unless an argument is included
secret = "bob".chars.to_a

puts "#{secret.join('')} is the secret" if TESTING

len = secret.join('').length
underscore_arr = Array.new(len, "_")

puts "Welcome to Hangman"

while (wrong < 3) && (underscore_arr.join('') != secret.join(''))
  # initialise right on each turn
  right = false

  puts "Hangman Secret Word: #{underscore_arr.join('')}"
  puts "Press 'Y' to see remaining letters: "
  y = STDIN.gets.chomp
  puts alph_arr.join(" ") if y == "Y" || y == "y"
  puts "You have #{3-wrong} lives remaining"

  puts "What is your guess: "
  guessed = STDIN.gets.chomp

  #find all occurances of guess in secret
  secret.each_with_index { |elm,idx|
    # update the array to  if element == letter
    if elm == guessed
      underscore_arr[idx] = elm
      right = true
    end
    alph_arr.each_with_index { |a_elm,a_idx|
      if a_elm == guessed
        alph_arr[a_idx] = "*"
      end
    }

  }

  # if there's no match, increment wrong
  wrong+=1 if !right
  # is this an option? --> !right ? wrong++

  right == true ? (puts "Correct guess") : (puts "Incorrect. #{3-wrong} lives left")
  puts "any key to continue"
  STDIN.getch
  # clear the screen
  system "clear"
end

if wrong == 3
  puts "You Lose"
else
  puts "You Win!"
end
puts "any key to exit"
STDIN.getch
