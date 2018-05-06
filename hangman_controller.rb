require 'io/console'
require_relative 'hangman'
require_relative 'view'

class HangmanGame
  DICTIONARY = ["school", "leslie", "purple", "hedgehog", "blue",
    "corin", "komodo"]

  # TODO: do I actually need these here?
  attr_reader :hangman, :view, :guess

  def initialize
    # TODO: should I save the secret here? lives?
    # TODO: where would I add a lives selection method?
    # TODO: do I actually need these here?
    @hangman = Hangman.new(6, DICTIONARY.sample)
    @view = View.new
  end

  def play
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
    # TODO: I don't like having to send the secret word back here.
    view.show_secret(hangman.secret.join(''))
    view.wait_and_clear_screen
  end
  true
end
