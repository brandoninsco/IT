@echo off
REM This file first asks the user to specify the drive letter, and then runs chkdsk f, dism restorehealth, 
REM and sfc scannow on said drive letter. These three commands are fairly quick and can be left to run on their own for a while. 

set /p windowsvar="What drive letter is the windows directory in?"

echo ===================
echo checking disk
echo ===================

chkdsk %windowsvar%: /f

echo ===================
echo check disk complete, running dism
echo ===================

dism /image:%windowsvar%: /cleanup-image /restorehealth

echo ===================
echo dism complete, running sfc
echo ===================

sfc /scannow /offwindir=%windowsvar%:\windows /offbootdir=%windows%var:

echo ===================
echo sfc complete
echo ===================

^G
^G
^G
^G
^G
REM This is just invalid commands to make the command prompt ding at you as a sort of alarm. This script was created to run in a 
REM windows pe environment, whether you use Hirens or bob ombs or whatever. 
pause