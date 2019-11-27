# Authoring Quickstarts

You can add a new quickstart to the repository, or update an existing one. Follow these steps to help you author the quickstart.

## Fork the repo and create a new branch

Firstly, fork the repository and create a new branch from master for making your changes. You must only create or update a single quickstart per branch.

There are no rules for the name of branch, but it helps to name it something descriptive, such as `porter-<my-quickstart-name>`.

Checkout the branch you created.

## Implementing your quickstart

The directories for the quickstarts in the repository are located with the following syntax:

`<CNAB-tool-name>/<bundle-name>`

We currently only support bundles built using [Porter](https://porter.sh/). So, if you are adding a new quickstart, create a new sub-directory `porter/<your-bundle-name>`.

All files for the quickstart must be placed in this sub-directory.

---

These are the default required and optional files to include:

### porter.yaml (required)

This is the manifest file that Porter uses to produce a bundle. More information about the manifest and how to author Porter bundles can be found in the [official Porter documentation](https://porter.sh/author-bundles/).

The `name` of the bundle should match the name of the sub-directory you created.

If you are updating an existing quickstart, you should ensure that the `version` number is incremented from the previous value.

The `invocationImage` property must be in format `cnabquickstarts.azurecr.io/porter/<name>:<version>`.

The `tag` property must be in format `cnabquickstarts.azurecr.io/porter/<name>/bundle:<version>`.

### Dockerfile.tmpl (optional)

This is a optional template file to use for the Docker invocation image used by the bundle. More information can be found in the [official Porter documentation](https://porter.sh/custom-dockerfile/).

### .dockerignore (optional)

This file specifies which files and directories to ignore when running COPY commands to the Docker image.

### INSTRUCTIONS.md (required)

This is a markdown file where you should include any specific details and instructions for the quickstart. The CI/CD will automatically generate a readme.md file for the quickstart, and this INSTRUCTIONS.md will be merged into that readme.

---

You can get started by copying the template files from the `porter-template` directory into your new sub-directory.

Additional files can added in the sub-directory, as required by the bundle.

## Submit a new PR to master branch

Once you have finished implementing your quickstart, commit the changes and push them to your branch. Then create a new pull request from your branch to the master branch in the original repo.

When you create the PR, this will automatically trigger a new GitHub Actions workflow for running the CI/CD process.

This CI/CD process will:
- Detect and validate the set of changes in the pull request
- Update the version of the bundle to reflect the pull request branch and signify that this is a pre-release version
- Build the bundle using the Porter tool
- Generate ARM templates to use for 'Deploy from Azure' buttons (see [Consuming: Deploy from Azure](consuming.md#deploy-from-azure) for more details)
- Generate a readme for the quickstart, automatically generating a table of credentials/parameters based on the manifest, and merging in your INSTRUCTIONS.md file
- Uploads the generated ARM templates and readme as artifacts to the workflow, so these can be downloaded and verified if you wish (when the PR is merged to master, these will be automatically commited to the quickstart directory)


Once a project maintainer is happy with the set of the changes and the bundle, they will merge the PR.

When merged to master, the CI/CD process runs again, with the steps as above (except the version number for the bundle is not updated to a pre-release version; it is instead kept as the value specified in the manifest), plus it will run the following additional steps:

- Publish the bundle to the cnabquickstarts Azure Container Registry
- Commit the ARM templates and readme to the branch

## Publishing bundle to your own registry

If you want to use the CI/CD workflow to publish the bundle to your own registry as part of testing (before merging your changes to the base repository), use the following steps:

- Fork the repository and create a branch for your new quickstart in your fork, as per the instructions above in [Fork the repo and create a new branch](#Fork-the-repo-and-create-a-new-branch)
- Create or use an existing container registry. You can use any OCI-compliant registry for publishing the bundle (e.g. Azure Container Registry, Docker Hub)
- In your forked repository, go to Settings > Secrets and add the following secrets for your registry:
    - REGISTRY_SERVER - the server path for your registry
    - REGISTRY_USERNAME - the username for the user to use for authenticating with your registry (must have permission to push)
    - REGISTRY_PASSWORD - the password for the user to use for authenticating with your registry
- Open a new pull request from the new forked branch to the master branch in your forked repo (**not** the base repo master branch)
- This will automatically trigger the Quickstart CI/CD GitHub workflow in your forked repository. As part of the workflow, it will publish your quickstart bundle to your configured registry, with a tag based on the pull request number and the commit.
- As you push new changes to your branch, the workflow will automatically trigger, and publish new versions of the bundle to your registry.
- When you are ready to merge your changes back to the base repository, you can create a new PR to the base repo, as per the instructions above in [Submit a new PR to master branch](#Submit-a-new-PR-to-master-branch)


