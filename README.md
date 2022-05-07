# Weight tracker app - Helm pipeline

A CI/CD pipeline I created for the build and deployment of the weight tracker web-app, the pipeline uses Helm to deploy the application to a kubernetes cluster.<br>
The Helm chart used for the pipeline can be found in this **<a href="https://staslevman5@dev.azure.com/staslevman5/Weight%20tracker%20-%20K8S%20and%20Helm/_git/NodsJS%20web%20app%20-%20Helm%20chart" title="">repository</a>**.<br>
Please click the link above to understand the chart structure.<br>

The pipeline gets triggered only upon commiting or merging into the master branch of both repositories.
Only two stages exist in this pipeline, Build and Deployment.

---

### CI/CD workflow
#### Upon triggering of the pipeline the first stage "Build" will do the folowing jobs:

1. Build image
    - Clone this repository (web application repository)
    - Build the docker image from the Dockerfile with tag of the build ID.

2. Check validity of chart
    - Clone Helm chart repository
    - Download the secure values file
    - Update chart dependencies
    - Check chart validity via `helm lint` command

##### These two jobs serve as code validation for the Dockerfile and the chart in both repositories before pushing the image/chart to the registry and continuing to deployment. <br>

3. Push image
    - The built image is pushed to the specified registry

4. Package and push chart
    - Clone Helm chart repository
    - Login to azure container registry ro ensure Helm can push the chart.
    - Download the secure values file
    - Update chart dependencies
    - Package the Helm folder into .tgz file with the version of the build ID.


The "Deployment" stage will commence upon succesfully completing the "Build" stage with the following jobs:

1. Deployment
    - 

