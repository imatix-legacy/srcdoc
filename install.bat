@echo off
if exist *.bak del *.bak
cp srcdoc     \usr\bin
cp srcdoc.bat \usr\bin
cp srcdoc.d   \usr\bin
cp srcdoc.fmt \usr\bin
zip -f %site%\pub\tools\srcdoc
