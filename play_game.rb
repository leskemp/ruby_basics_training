#!/usr/local/bin/ruby -w

require_relative 'hangman_controller'

game = HangmanGame.new(3.DICTIONARY.sample).play
