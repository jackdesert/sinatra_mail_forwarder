module Formatter

  def self.no_double_arrows(input)
    input.gsub! /\n?^>>.*/, ''
    input
  end
end

