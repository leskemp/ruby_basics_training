require 'io/console'
require_relative 'hangman'
require_relative 'view'

class HangmanGame

dictionary = ["bob", "leslie", "purple", "a"]
hangman = Hangman.new(3, dictionary.sample)
view = View.new

view.show_welcome

while hangman.running?
  guess=""
  view.show_status(hangman.show_hidden_word, hangman.show_available_letters,
    hangman.lives)
  until hangman.valid? guess
    guess = view.prompt_for_guess
  end
  view.show_guess_outcome(hangman.make_a_move(guess))
  view.wait_and_clear_screen
end

view.show_game_over(hangman.won?)
view.show_secret(hangman.secret.join(''))
view.wait_and_clear_screen
