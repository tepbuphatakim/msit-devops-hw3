# Simple Flask Application

## Docker Setup

1. Build the Docker image:
```bash
docker build -t flask-app .
```

2. Run the container:
```bash
docker run -p 5000:5000 flask-app
```

```bash
docker pull your-username/flask-app:1.0.0

docker pull your-username/flask-app:latest

docker run -d -p 5000:5000 your-username/flask-app:1.0.0
```

## Publish Docker image on tag with CI/CD

```bash
# Create a new version tag
git tag v1.0.0

# Push the tag to trigger the workflow
git push origin v1.0.0
```

## Automate run

```bash
sh deploy.sh
```
