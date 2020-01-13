# keynote-exporter

Shell script + AppleScript utility to bulk export Keynote decks to either PDF or PowerPoint format

# Dependencies
* macOS Mojave or greater
* Keynote 9.x or greater
* frog corporate fonts `BentonSansF` and `Quarto` installed (along with any other custom fonts required by the source Keynote decks being exported)

# Usage
* Copy the `_export-keynotes.sh` script into a source directory containing one or more Keynote (.key) files to export
* Open a `Terminal` app session within the source directory
* Execute the exporter script with the command `./_export-keynotes.sh`
* The script will prompt for a desired output format of either `PDF` or `PPTX` (PowerPoint)
* Each Keynote file within the source directory will be processed and the corresponding output format will be placed alongside it within the same source directory
