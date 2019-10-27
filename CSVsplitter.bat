@echo off
setLocal EnableDelayedExpansion

set /p limit="Enter batch size: "

set /a lineCounter=!limit! + 1
set filenameCounter=0
set totalLines=0

set /p file="Enter File Name: "

set name=
set extension=
for %%a in (%file%) do (
    set "name=%%~na"
    set "extension=%%~xa"
)

for /f "tokens=*" %%a in (%file%) do (
    set /a totalLines=!totalLines! + 1

    if /i !totalLines! equ 1 (
      set firstLine=%%a
    ) else (
      if /i !lineCounter! gtr !limit! (
        set /a filenameCounter=!filenameCounter! + 1
        set lineCounter=1
        set splitFile=!name!-part!filenameCounter!!extension!
        echo Created !splitFile!.
        echo !firstLine!> !splitFile!
      )
      echo %%a>> !splitFile!
      set /a lineCounter=!lineCounter! + 1
    )
)

echo
echo Total of !totalLines! lines
echo

pause
