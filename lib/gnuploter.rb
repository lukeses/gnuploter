require "gnuploter/version"
require "fileutils"

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

    def plot_to_png(function, filename, path='')
      if path.empty?
        @plot.puts 'set term png'
        @plot.puts "set output \"#{filename}\""
        @plot.puts "plot " + function
      else
        FileUtils.mkdir_p(path)
        @plot.puts 'set term png'
        @plot.puts "set output \"#{File.join(path,filename)}\""
        @plot.puts "plot " + function
      end
#      @plot.puts "set term x11"
    end

  end
end
