@echo off
REM start-all.bat: Start all subprojects in separate command prompt windows

echo Starting all services...
echo This will open 3 new command prompt windows for:
echo 1. Spring Admin Server (port 9090)
echo 2. Spring Service (port 8080)
echo 3. Quarkus Server (port 8081)
echo.

REM Start Spring Admin Server
echo Starting Spring Admin Server...
start "Spring Admin Server" cmd /k "cd spring-admin-server && echo Starting Spring Admin Server on port 9090... && mvn spring-boot:run"

REM Wait a bit before starting the next service
timeout /t 2 /nobreak >nul

REM Start Spring Service
echo Starting Spring Service...
start "Spring Service" cmd /k "cd spring-service && echo Starting Spring Service on port 8080... && mvn spring-boot:run -Dspring-boot.run.profiles=dev"

REM Wait a bit before starting the next service
timeout /t 2 /nobreak >nul

REM Start Quarkus Server
echo Starting Quarkus Server...
start "Quarkus Server" cmd /k "cd quarkus-server && echo Starting Quarkus Server on port 8081... && mvn quarkus:dev"

echo.
echo All services are starting up...
echo.
echo URLs will be available at:
echo - Spring Admin UI: http://localhost:9090
echo - Spring Service: http://localhost:8080 (Swagger: http://localhost:8080/swagger-ui)
echo - Quarkus Service: http://localhost:8081/hello (Dev UI: http://localhost:8081/q/dev/)
echo.
echo Wait a few moments for all services to start up completely.
echo.
pause
