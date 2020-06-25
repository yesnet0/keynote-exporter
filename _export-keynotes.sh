#! /bin/sh

read -p "Enter export format (PDF or PPTX): " EXPORT_FORMAT

EXPORT_FORMAT=`echo $EXPORT_FORMAT | awk '{print toupper($0)}'`

case $EXPORT_FORMAT in (*"PDF"*|*"PPTX"*)
  FILE_EXTENSION=`echo $EXPORT_FORMAT | awk '{print tolower($0)}'`
  DEFAULT_IFS=$IFS
  IFS=$'\n'
  for FILE_INPUT in `find "${PWD}" -name \*.key`; do
    FILE_OUTPUT=`echo $FILE_INPUT | sed "s/\.key$/\.$FILE_EXTENSION/"`
    echo Exporting $FILE_INPUT to $EXPORT_FORMAT
osascript << EOF
      tell application "System Events"
        tell application "Keynote"
          activate
          open POSIX file "${FILE_INPUT}"
          delay 5
          if "${EXPORT_FORMAT}" is "PDF" then
            export front document to POSIX file "${FILE_OUTPUT}" as PDF
          else if "${EXPORT_FORMAT}" is "PPTX" then
            export front document to POSIX file "${FILE_OUTPUT}" as Microsoft PowerPoint
          end if
        end tell
        delay 5
        do shell script "killall Keynote"
      end tell
EOF
  done
  IFS=$DEFAULT_IFS
;;
(*)
  echo Invalid format entered. PDF or PPTX formats are supported. Please try again.
;;esac
