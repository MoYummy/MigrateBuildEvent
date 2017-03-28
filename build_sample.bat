set workspace=%1
if [%workspace%] == [] goto end

pushd %workspace%

setLocal EnableDelayedExpansion
if defined VS140COMNTOOLS call "%VS140COMNTOOLS%vsvars32.bat"

msbuild.exe SampleCpp\SampleCpp.sln /m:16 /p:Configuration=Release /p:Platform=x64 > %workspace%\BuildSampleCpp.sln.Optimize.x64.!Inve.log 2>&1
msbuild.exe SampleCpp\SampleCpp.sln /m:16 /p:Configuration=Debug /p:Platform=x64 > %workspace%\BuildSampleCpp.sln.Debug.x64.!Inve.log 2>&1
msbuild.exe SampleCpp\SampleCpp.sln /m:16 /p:Configuration=Release /p:Platform=x86 > %workspace%\BuildSampleCpp.sln.Optimize.x86.!Inve.log 2>&1
msbuild.exe SampleCpp\SampleCpp.sln /m:16 /p:Configuration=Debug /p:Platform=x86 > %workspace%\BuildSampleCpp.sln.Debug.x86.!Inve.log 2>&1

msbuild.exe SampleDotNet\SampleDotNet.sln /m:16 /p:Configuration=Release /p:Platform=x64 > %workspace%\BuildSampleDotNet.sln.Optimize.x64.!Inve.log 2>&1
msbuild.exe SampleDotNet\SampleDotNet.sln /m:16 /p:Configuration=Debug /p:Platform=x64 > %workspace%\BuildSampleDotNet.sln.Debug.x64.!Inve.log 2>&1
msbuild.exe SampleDotNet\SampleDotNet.sln /m:16 /p:Configuration=Release /p:Platform=x86 > %workspace%\BuildSampleDotNet.sln.Optimize.x86.!Inve.log 2>&1
msbuild.exe SampleDotNet\SampleDotNet.sln /m:16 /p:Configuration=Debug /p:Platform=x86 > %workspace%\BuildSampleDotNet.sln.Debug.x86.!Inve.log 2>&1

popd

:end
