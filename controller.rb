#!/usr/local/bin/ruby -w

# TODO: instantiate hangman object (hangman)initialise game
class Hangman
  def initialise
    lives = 3
    alphabet_array = ("a".."z").to_a
    move_stack = Array.new
    # TODO: create a method to create an array of secret words
    hangman_word = ["leslie", "bob", "purple"].sample
  end

  def get_guess
    # TODO: prompt "Guess a letter from available letters"
    # TODO: print alphabet_array with current move_stack blanked with '*'
    # TODO: get guess
    # TODO: make sure the guessed_letter is a..z or A..Z
    # TODO: push guess onto move_stack
    move_stack << guessed_letter
  end
end


# TODO: view show Welcome

# TODO: while hangman running?

# TODO: view show round/initialise round(?) -hidden word, avail letters, lives

# TODO: get move, a..z only
# TODO: in move: push move (and match and set hangman running)
# TODO: view move result

# TODO: console wait

#end loop

# TODO: hangman result

# TODO: console wait
