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

When you create the PR, this will automatically trigger a new GitHub Actions workflow for running the CI/CD process (NOTE: THIS CURRENTLY DOES NOT WORK FOR PULL REQUESTS FROM FORKED REPOS).

This CI/CD process will:
- Detect and validate the set of changes in the pull request
- Update the version of the bundle to reflect the pull request branch and signify that this is a pre-release version
- Build the bundle using the Porter tool
- Publish the pre-release bundle to the cnabquickstarts Azure Container Registry
- Generate ARM templates to use for 'Deploy from Azure' buttons (see [Consuming: Deploy from Azure](consuming.md#deploy-from-azure) for more details)
- Generate a readme for the quickstart, automatically generated a table of credentials/parameters based on the manifest, and merging in your INSTRUCTIONS.md file
- Commit the ARM templates and readme to the branch

Once a project maintainer is happy with the set of the changes and the bundle, they will merge the PR.

When merged to master, the CI/CD process runs again, with the same steps as above, except the version number for the bundle is not updated to a pre-release version; it is instead kept as the value specified in the manifest.