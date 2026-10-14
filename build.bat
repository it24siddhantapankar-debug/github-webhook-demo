@echo off
echo ==========================================
echo GitHub Webhook Demo - Jenkins CI Build
echo ==========================================
echo.
echo Build triggered successfully.
echo Repository workspace: %WORKSPACE%
echo.
if exist index.html (
  echo CHECK PASSED: index.html exists.
) else (
  echo CHECK FAILED: index.html was not found.
  exit /b 1
)
echo.
echo CI build completed successfully.
exit /b 0
