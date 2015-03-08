require "gnuploter/version"

module Gnuploter
  class Gnuplot
    attr_accessor :title, :key, :samples, :style
 # @parameters = %w(title key samples style)

    def initialize
      @plot = IO.popen("gnuplot", "w")
      @parameters = %w(title key samples style)
    end

    def set_parameters
      @parameters.each do |parameter|
        @plot.puts 'set ' + parameter + ' ' +eval(parameter) unless defined? parameter
        puts 'set ' + parameter + ' ' +eval(parameter) unless defined? parameter
      end
    end

    def plot(function)
      @plot.puts "plot " + function
    end
  end
end
