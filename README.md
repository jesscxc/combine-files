
# Combine Files

Gets text files in folder, copys the text, moves the files to 'combined/', transliterates unicode to ASCII, saves to clipboard, writes the last combine to text file.

Designed for OS X.

## Installing

	$ git clone https://github.com/jessc/combine_files.git

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
