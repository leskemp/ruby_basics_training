#!/usr/local/bin/ruby -w

require 'io/console'

# initialising vars
TESTING = false
wrong = 0
alph_arr = ("a".."z").to_a
guessed = ''
secret = "leslie".chars.to_a
len = secret.join('').length
underscore_arr = Array.new(len, "_")

puts "#{secret.join('')} is the secret" if TESTING

puts "Welcome to Hangman"

while (wrong < 3) && (underscore_arr != secret)
  # initialise right to false on each turn
  right = false

  puts "Hangman Secret Word: #{underscore_arr.join('')}"
  puts "Untried letters: \n#{alph_arr.join(" ")}"
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
