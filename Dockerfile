# Use the official Python image as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Install virtualenv
RUN pip install --no-cache-dir virtualenv

# Create a virtual environment named "venv"
RUN virtualenv venv

# Activate the virtual environment
RUN . venv/bin/activate

# Copy the requirements file into the container
COPY requirements.txt init_db.py /app/

# Install the required Python packages within the virtual environment
RUN venv/bin/pip install -r requirements.txt

# Copy the rest of the application files into the container
COPY . /app/

# Expose any necessary ports
EXPOSE 3111

# Define the command to run your application within the virtual environment
CMD ["/bin/bash", "-c", ". venv/bin/activate && python init_db.py && python app.py "]
