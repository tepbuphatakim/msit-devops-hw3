# Simple Flask Application

## Publish Docker image on tag with CI/CD

```bash
# Create a new version tag
git tag v1.0.0

# Push the tag to trigger the workflow
git push origin v1.0.0
```

## Automate run

System will prompt to ask port and tag.

```bash
sh deploy.sh
```
