#!/usr/bin/env ruby
# encoding: utf-8

# 2013-04-26
# Jesse Cummins
# https://github.com/jessc

# Gets text files in folder, copys the text, moves the files to 'combined/',
# transliterates unicode to ASCII, saves to clipboard,
# writes the last combine to text file.


require 'fileutils'
require 'stringex'

class CombineFiles
  def initialize(folder_loc)
    @folder_loc = folder_loc
  end

  def run
    files = Dir.glob(@folder_loc + "*.txt")

    text = ""
    files.each do |file|
      f = File.open(file, :encoding => "UTF-8")
      text += f.read
      text += "\n" unless text.end_with? "\n"
      f.close
      FileUtils.move(file, @folder_loc + "combined/" + file[(@folder_loc.length)..file.length])
    end

    # So as not to overwrite with a blank file.
    unless text == ""
      File.open(@folder_loc + "last_combine.text", "w") do |f|
        f.write(pbcopy(to_ascii(text)))
      end
    end
  end

  def pbcopy(string)
    IO.popen('pbcopy', 'w') { |f| f << string.to_s }
    string.to_s
  end

  def to_ascii(string)
    Stringex::Unidecoder.decode(string)
  end
end


# In order to make an OS X app with Platypus, have to have all these
# "../../../" so that it will look out of the Combine.app package.
# Use "./" if you want it to look in the current folder.

folder_loc = "../../../"
folder_loc = "./"

CombineFiles.new(folder_loc).run

