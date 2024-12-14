#!/bin/bash

echo "Testing Frontend Container..."
curl -I http://localhost:9000 && echo "Frontend is running!" || echo "Frontend failed!"

# echo "Testing Backend Container..."
# curl -X GET http://localhost:3000/health && echo "Backend is running!" || echo "Backend failed!"


