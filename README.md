# Docker + Kubernetes Flask Deployment Project

---

## 📂 Project Structure

```
docker-k8s-flask-deployment/
│
├── app.py
├── requirements.txt
├── Dockerfile
├── deployment.yaml
├── service.yaml
└── README.md
```

---

## 🚀 Project Overview

This project demonstrates a complete **DevOps workflow**:

1. Build a simple Flask web application
2. Containerize it using Docker
3. Push the image to Docker Hub
4. Deploy the container on Kubernetes
5. Expose the application using a Kubernetes Service

---

## 🧠 Technologies Used

* Python (Flask)
* Docker
* Docker Hub
* Kubernetes (Deployment & Service)
* Minikube (for local testing)

---

## 🧩 Application Code

### `app.py`

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello, Kubernetes!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

### `requirements.txt`

```
Flask==2.3.2
```

---

## 🐳 Docker Configuration

### `Dockerfile`

```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
```

---

## ☸️ Kubernetes Configuration

### `deployment.yaml`

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: flask-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: flask-app
  template:
    metadata:
      labels:
        app: flask-app
    spec:
      containers:
      - name: flask-container
        image: <your-dockerhub-username>/flask-app:1.0
        ports:
        - containerPort: 5000
```

### `service.yaml`

```yaml
apiVersion: v1
kind: Service
metadata:
  name: flask-service
spec:
  selector:
    app: flask-app
  type: NodePort
  ports:
    - protocol: TCP
      port: 5000
      targetPort: 5000
      nodePort: 30007
```

---

## 🔧 Step-by-Step Execution

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/<your-username>/docker-k8s-flask-deployment.git
cd docker-k8s-flask-deployment
```

---

### 2️⃣ Build Docker Image

```bash
docker build -t <your-dockerhub-username>/flask-app:1.0 .
```

---

### 3️⃣ Push Image to Docker Hub

```bash
docker login
docker push <your-dockerhub-username>/flask-app:1.0
```

---

### 4️⃣ Start Kubernetes (Minikube)

```bash
minikube start
```

---

### 5️⃣ Deploy Application on Kubernetes

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

Verify resources:

```bash
kubectl get pods
kubectl get svc
```

---

### 6️⃣ Access the Application

```bash
minikube service flask-service
```

Or via browser:

```
http://<node-ip>:30007
```

---

## ✅ Expected Output

```
Hello, Kubernetes!
```

---

## 🎯 Why This Project is Important

* Demonstrates **real-world DevOps workflow**
* Covers Docker + Kubernetes integration
* Shows container deployment and service exposure
* Strong project for **DevOps / Cloud fresher resumes**

---

## 📌 Future Improvements

* Add Kubernetes ConfigMap & Secrets
* Use LoadBalancer service
* Add CI/CD pipeline (GitHub Actions)
* Add Helm chart

---

## 👤 Author

Shivam Ubale

---

⭐ If you like this project, don’t forget to star the repository!

