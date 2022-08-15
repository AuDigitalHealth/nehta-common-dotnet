del *.nupkg

msbuild /p:Configuration=Release

REM NuGet.exe pack Common\Common.csproj
REM Use dotnet for packaing now
dotnet pack .\Common\Common.csproj -c Release -o .

forfiles /m *.nupkg /c "cmd /c NuGet.exe push @FILE -Source https://www.nuget.org/api/v2/package"
