# Fullstack Dockerized Application

This project demonstrates a containerized 3-tier fullstack application consisting of a **frontend**, **backend**, and **database**, orchestrated using Docker and Docker Compose. The application uses port **9000** for the frontend.

---

## **Setup Instructions**

### **Prerequisites**
1. Install [Docker](https://docs.docker.com/get-docker/) on your system.
2. Install [Docker Compose](https://docs.docker.com/compose/install/) (if not included with Docker).
3. Clone the repository:
   ```bash
   git clone https://github.com/Nicholina1/Todo-list-app.git
   ```

### **Building and Running the Containers**
1. Build and start all services:
   ```bash
   docker compose up --build
   ```
   This will:
   - Build Docker images for the **frontend** and **backend** components.
   - Start containers for all components.

2. Access the application:
   - **Frontend**: Open [http://localhost:9000](http://localhost:9000) in your browser.

### **Stopping the Containers**
To stop the running containers without removing them:
```bash
docker compose stop
```

To stop and remove containers, networks, and volumes:
```bash
docker compose down
```

---

## **Network and Security Configurations**

### **Network**
- **Custom Docker Network**: Docker Compose creates a custom network for seamless communication between the frontend and backend containers.
- **Exposed Ports**:
  - Frontend: **9000** (mapped to the container's internal port 80)
  - Backend: **3000**

### **Security**
- **Environment Variables**: Database credentials are securely passed through environment variables in the `docker-compose.yml` file. Update the credentials as needed.
- **Port Conflicts**: Ensure no other service is using the port (**9000**) to avoid conflicts.

---

## **Troubleshooting Guide**

### **Common Issues**
1. **Frontend Not Running**:
   - Symptom: Visiting [http://localhost:9000](http://localhost:9000) shows no response.
   - Cause: Port 80 (default frontend port) might be in use by another service.
   - Solution: Change the frontend port in `docker-compose.yml` to an available port (e.g., **9000**) and rebuild:
     ```yaml
     ports:
       - "9000:80"
     ```
     Then restart the containers:
     ```bash
     docker compose down && docker compose up --build
     ```

2. **Docker Daemon Not Running**:
   - Symptom: Docker commands fail with errors like `Cannot connect to the Docker daemon`.
   - Solution: Start the Docker service on your system.

3. **Port Conflicts**:
   - Symptom: Docker fails to bind to a port (e.g., `Bind for 0.0.0.0:<80> failed`).
   - Solution: Check if another service is using the port and free it or update the port mapping in `docker-compose.yml`.

---

## **Testing the Setup**
Use the provided script to test the containers:
```bash
./test_containers.sh
```
This script will:
- Verify if the **frontend** is accessible.

---

