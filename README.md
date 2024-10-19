# Deployment App

This application is a "Proxy" which downloads the correct source code
and runs all deployment hooks on Clever Cloud.

## Environment variables

- `MONSIEURBIZ_ARTIFACT_URL` (required): It contains the URL of the artifact to download. No default value.
  This artifact is basically a gzip tarball file containing the source code of the application.
- `MONSIEURBIZ_CC_PRE_BUILD_HOOK` (optional): It contains the value which was originally in the standard `CC_PRE_BUILD_HOOK` environment variable.
  But since we use the `CC_PRE_BUILD_HOOK` for the proxy app, we needed a new name for this var.

## How to use it

Just set the variables of your project as usual.
But add those three variables to your Clever Cloud application settings:
- `MONSIEURBIZ_ARTIFACT_URL`: URL of your application.tgz
- `MONSIEURBIZ_CC_PRE_BUILD_HOOK`: Value of the `CC_PRE_BUILD_HOOK` of your app.
- `CC_PRE_BUILD_HOOK=./monsieurbiz_deploy_app.sh`

Then, you can deploy your app as usual.
