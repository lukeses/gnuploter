require 'spec_helper'

describe Gnuploter do
  it 'has a version number' do
    expect(Gnuploter::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end

  it 'checks if gnuploter creates a file with proper name' do
    gnuploter = Gnuploter::Gnuplot.new
    gnuploter.title = "Test of the gnuploter"
    gnuploter.plot_to_png("[-10:10] sin(x)", "file1.png", "spec/files")
    expect(File.exist?("spec/files/file1.png")).to eq(true)
  end



end
