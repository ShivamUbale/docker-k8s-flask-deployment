#Base image
FROM python:3.11-slim

#Set working directory
WORKDIR /app

#Copy file
COPY requirements.txt .
RUN pip install	--no-cache-dir -r requirements.txt

COPY . .

#Expose the port Flask runs on
EXPOSE 5000

#Run the application
CMD ["python","app.py"] 
