class Hangman
  ALPHABET = ("a".."z").to_a

  attr_reader :lives, :secret, :guess_stack

  def initialize(lives, secret)
    @lives = lives.to_i
    @secret = secret.chars
    @guess_stack = []
  end

  def running?
    # TODO: lives > 0 && (secret-guess_stack).any?
    if (lives <= 0) || ((secret - guess_stack).empty?)
      false
    else
      true
    end
  end

  def won?
    # TODO: lives > 0
    if lives <= 0
      false
    else
      true
    end
  end

  def make_a_move(guess)
    guess_stack << guess.downcase
    if secret.include?(guess.downcase)
      true
    else
      @lives-=1
      false
    end
  end

  def valid?(guess)
    if (ALPHABET.include? guess.downcase) && (!guess_stack.include? guess.downcase)
      true
    else
      false
    end
  end

  def show_hidden_word
    secret.map { |letter| (guess_stack.include?(letter) ? letter : '_') }
  end

  def show_available_letters
    ALPHABET.map { |letter| (guess_stack.include?(letter) ? "*" : letter) }
  end
end
