"C:\Program Files (x86)\Eiffel Software\EiffelStudio 16.05 GPL\studio\spec\windows\bin\ec.exe" -finalize -config moonshot.ecf -target moonshot
cd EIFGENs\moonshot\F_code
"C:\Program Files (x86)\Eiffel Software\EiffelStudio 16.05 GPL\studio\spec\windows\bin\finish_freezing.exe"
cd ..\..\..
copy /Y .\EIFGENs\moonshot\F_code\moonshot.exe
"C:\Program Files (x86)\Inno Setup 5\iscc.exe" "moonshot.iss"
"C:\Program Files (x86)\WinSCP\WinSCP.exe" /script=ftp_to_production.txt