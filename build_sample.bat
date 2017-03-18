set workspace=%1
if [%workspace%] == [] goto end

pushd %workspace%

setLocal EnableDelayedExpansion
if defined VS140COMNTOOLS call "%VS140COMNTOOLS%vsvars32.bat"

msbuild.exe SampleDotNet\SampleDotNet.sln /p:Configuration=Release /p:Platform=x64 > %workspace%\BuildSampleDotNet.sln.Optimize.x64.!Inve.log 2>&1
msbuild.exe SampleDotNet\SampleDotNet.sln /p:Configuration=Debug /p:Platform=x64 > %workspace%\BuildSampleDotNet.sln.Debug.x64.!Inve.log 2>&1
msbuild.exe SampleDotNet\SampleDotNet.sln /p:Configuration=Release /p:Platform=x86 > %workspace%\BuildSampleDotNet.sln.Optimize.x86.!Inve.log 2>&1
msbuild.exe SampleDotNet\SampleDotNet.sln /p:Configuration=Debug /p:Platform=x86 > %workspace%\BuildSampleDotNet.sln.Debug.x86.!Inve.log 2>&1

popd

:end