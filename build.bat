@echo off

rem Chạy lệnh build_runner
echo Run build_runner...
call fvm flutter pub run build_runner build --delete-conflicting-outputs

rem Các lệnh hay dùng khác
rem Ví dụ: chạy unit test
echo Run unit test...
call fvm flutter test

rem Ví dụ: chạy kiểm tra lint
echo Check lint...
call fvm flutter analyze

rem Thông báo hoàn thành
echo Done.
pause