# Deployment App

This application is a "Proxy" which downloads the correct source code
and runs all deployment hooks on Clever Cloud.

## Environment variables

- `MONSIEURBIZ_ARTIFACT_URL` (required): It contains the URL of the artifact to download. No default value.
  This artifact is basically a gzip tarball file containing the source code of the application.
- `MONSIEURBIZ_CC_PRE_BUILD_HOOK` (optional): It contains the value which was originally in the standard `CC_PRE_BUILD_HOOK` environment variable.
  But since we use the `CC_PRE_BUILD_HOOK` for the proxy app, we needed a new name for this var.
- `CELLAR_BACKUP_KEY_ID`, `CELLAR_BACKUP_KEY_SECRET` and `CELLAR_BACKUP_HOST` (optionals): Set these variables if you want to download the artifact directly from the cellar.

## How to use it

Just set the variables of your project as usual.
But add those three variables to your Clever Cloud application settings:
- `MONSIEURBIZ_ARTIFACT_URL`: URL of your application.tgz
- `MONSIEURBIZ_CC_PRE_BUILD_HOOK`: Value of the `CC_PRE_BUILD_HOOK` of your app.
- `CC_PRE_BUILD_HOOK=./monsieurbiz_deploy_app.sh`

Then, you can deploy your app as usual.


## How to use Cellar directly

- `CELLAR_BACKUP_KEY_ID`, `CELLAR_BACKUP_KEY_SECRET` and `CELLAR_BACKUP_HOST`: The host, key ID and key secrect of the cellar addon you wish to use
- `MONSIEURBIZ_ARTIFACT_URL`: the s3 URL with the Bucket name, example: `s3://<BUCKET>/application.tgz`
- `MONSIEURBIZ_CC_PRE_BUILD_HOOK`: Value of the `CC_PRE_BUILD_HOOK` of your app.
- `CC_PRE_BUILD_HOOK=./monsieurbiz_deploy_app.sh`
