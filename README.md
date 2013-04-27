
# Combine Files

Gets text files in folder, copys the text, moves the files to 'combined/', transliterates unicode to ASCII, saves to clipboard, writes the last combine to text file.

Designed for OS X.

Requires stringex gem.


## Installing

	$ gem install stringex
	$ git clone https://github.com/jessc/combine_files.git


## Platypus Instructions

This script is designed to work well with [Platypus](http://sveinbjorn.org/platypus).

To install the gem dependency in Platypus, follow these steps:

1. Download the .gem from [RubyGems.org](http://rubygems.org/gems/stringex).
2. Make a gems/ folder. Put the .gem inside.
3. Using a terminal, cd to just above the gems/ folder.
4. This should create a bunch of folders when you install the gem locally:

		$ export GEM_HOME=$PWD/gems/
		$ gem install --local gems/stringex-1.5.1.gem

5. Create your Platypus app, add the gems/ folder to the list of files to be bundled.


## Regarding Ruby, Platypus, and Gem Dependencies 

To get Platypus to work with gems, follow the above instructions, then at the top of your script add:

	require 'rubygems'
	Gem.use_paths(nil, Gem.path << 'gems/')

This will tell Platypus to look in the gems/ folder for the libraries you need.


## Usage

You can edit the folder_loc variable at the bottom of the script. Then use:

	CombineFiles.new(folder_loc).run

For instance:

	CombineFiles.new("./").run

would combine the files in the current folder.


## Contributing
- if no combined/ folder, create it
- choose files to ignore
- port to other operating systems
