# 1. Use an official, lightweight Python image
FROM python:3.10-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy just the requirements first (this makes rebuilding the image faster)
COPY requirements.txt .

# 4. Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of our application code into the container
COPY . .

# 6. Expose the port the app runs on
EXPOSE 8000

# 7. The command to run when the container starts
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]