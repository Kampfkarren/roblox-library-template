Write-Output "Checking selene..."
selene --no-summary .\src\ .\chat-demo\

Write-Output "Checking luau-analyze..."
rojo sourcemap chat.project.json | Out-File -Encoding ASCII -FilePath sourcemap.json
# This will check src because it includes it
luau-lsp.exe analyze .\demo\ --defs=globalTypes.d.lua --sourcemap=sourcemap.json --no-strict-dm-types --ignore=Packages/** --ignore=DevPackages/** --flag:LuauTinyControlFlowAnalysis=True

Write-Output "Done"
