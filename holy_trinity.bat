@echo off
set /p windows="What drive letter is the windows directory in?"
echo checking disk
chkdsk %windows%: /f
echo check disk complete, running dism
dism /image:%windows%: /cleanup-image /restorehealth
echo dism complete, running sfc
sfc /scannow /offwindir=%windows%:\windows /offbootdir=%windows%:
echo sfc complete
^G
^G
^G
^G
^G
pause