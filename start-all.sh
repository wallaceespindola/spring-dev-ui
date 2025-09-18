#!/bin/bash
# start-all.sh: Start all subprojects in separate terminals

echo "Starting all services..."
echo "This will open 3 new terminal windows for:"
echo "1. Spring Admin UI Server (port 9090)"
echo "2. Spring Service (port 8080)"
echo "3. Quarkus Service (port 8081)"
echo ""

# Start Spring Admin UI Server
echo "Starting Spring Admin UI Server..."
gnome-terminal --title="Spring Admin UI Service" -- bash -c "cd spring-admin-ui && echo 'Starting Spring Admin UI Service on port 9090...' && mvn spring-boot:run; exec bash"

# Wait a bit before starting the next service
sleep 2

# Start Spring Service
echo "Starting Spring Service..."
gnome-terminal --title="Spring Service" -- bash -c "cd spring-service && echo 'Starting Spring Service on port 8080...' && mvn spring-boot:run -Dspring-boot.run.profiles=dev; exec bash"

# Wait a bit before starting the next service
sleep 2

# Start Quarkus Service
echo "Starting Quarkus Service..."
gnome-terminal --title="Quarkus Service" -- bash -c "cd quarkus-service && echo 'Starting Quarkus Service on port 8081...' && mvn quarkus:dev; exec bash"

echo ""
echo "All services are starting up..."
echo ""
echo "URLs will be available at:"
echo "- Spring Admin UI: http://localhost:9090"
echo "- Spring Service: http://localhost:8080 (Swagger: http://localhost:8080/swagger-ui)"
echo "- Quarkus Service: http://localhost:8081/hello (Dev UI: http://localhost:8081/q/dev/)"
echo ""
echo "Wait a few moments for all services to start up completely."
