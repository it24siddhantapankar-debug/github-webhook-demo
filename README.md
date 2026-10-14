# GitHub Webhook Demo

A small project for demonstrating GitHub Webhooks with Jenkins.

## Files

- `index.html` — sample project page.
- `build.bat` — Windows build/check script for a Jenkins Freestyle job.
- `Jenkinsfile` — optional Jenkins Pipeline definition.

## Recommended lab setup (Freestyle project)

1. Create a GitHub repository named `github-webhook-demo`.
2. Upload these files to the repository.
3. In Jenkins, create a **Freestyle project**.
4. Under **Source Code Management**, choose **Git** and enter the repository's HTTPS URL. Set the branch to `*/main` (or your actual default branch).
5. Under **Build Triggers**, enable **GitHub hook trigger for GITScm polling**.
6. Under **Build Steps**, choose **Execute Windows batch command** and enter:

   ```bat
   call build.bat
   ```

7. Save the job and run **Build Now** once to verify checkout and build.
8. Configure a GitHub webhook with content type `application/json`, event **Just the push event**, and payload URL:

   `https://YOUR-PUBLIC-JENKINS-HOST/github-webhook/`

   Replace the example hostname with your actual reachable HTTPS endpoint. GitHub cannot send webhooks directly to `localhost`.

9. Edit `index.html` or `README.md`, commit, and push. Confirm a new Jenkins build starts automatically.

## Optional: Jenkins Pipeline

If using a Pipeline job instead, choose **Pipeline script from SCM**, select Git, enter the repository URL and branch, and set Script Path to `Jenkinsfile`. Do not also add the Freestyle build step.

## Verification

- GitHub: **Settings → Webhooks → Recent Deliveries** — inspect the latest push delivery.
- Jenkins: open the triggered build and view **Console Output**.
- A successful build should print `CHECK PASSED: index.html exists.`

## Safety note

Only expose Jenkins through a trusted, secured endpoint. Keep Jenkins updated, require authentication, and close any temporary tunnel after the lab.
