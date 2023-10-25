# Use an appropriate base image, for instance, python:3.x
FROM python:3.9-slim

# Install any OS-level dependencies if necessary
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python dependencies with force reinstall
RUN pip install --no-cache-dir --force-reinstall -r requirements.txt

# Copy the entire project into the container (this can be narrowed down as required)
COPY . .

# The default command to run when starting the container
CMD ["python", "./spark_stream.py"]
