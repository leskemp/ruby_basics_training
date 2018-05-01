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

system "clear"

puts "#{secret.join('')} is the secret word\n" if TESTING
puts "Welcome to Hangman"

# TODO: while game_running? (using globals)
while (wrong < 3) && (underscore_arr != secret)
  # initialise right to false on each turn
  right = false

  puts "Hangman Secret Word: #{underscore_arr.join('')}"
  puts "Untried letters: \n#{alph_arr.join(" ")}"
  puts "You have #{3-wrong} lives remaining"

  puts "What is your guess: "
# TODO: sanitise
  guessed = STDIN.gets.chomp

  #find all occurances of guess in secret
  secret.each_with_index { |secret_letter,secret_index|
    # update the array to  if secret_letter == guessed
    if secret_letter == guessed
      underscore_arr[secret_index] = secret_letter
      right = true
    end
    #update the available letters array with a * at guessed letter
    # TODO: refactor explicit vars
    alph_arr.each_with_index { |a_elm,a_idx|
      if a_elm == guessed
        alph_arr[a_idx] = "*"
      end
    }

  }

  # if there's no match, increment wrong
  wrong+=1 unless right
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
