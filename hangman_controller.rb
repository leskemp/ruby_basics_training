#!/usr/local/bin/ruby -w

require 'io/console'
require_relative 'hangman'
require_relative 'view'

# TODO: create a dictionary.sample
dictionary = ["bob", "leslie", "purple", "a"]
hangman = Hangman.new(3, dictionary.sample)
view = View.new

view.welcome

while hangman.running?
  guess=""
  view.status(hangman.show_hidden_word, hangman.show_available_letters,
    hangman.lives)
  until hangman.sanitised? guess
    guess = view.prompt
  end
  view.correct(hangman.make_a_move(guess))
  view.wait
end

view.game_over(hangman.won?)
view.reveal(hangman.secret.join(''))
view.wait
