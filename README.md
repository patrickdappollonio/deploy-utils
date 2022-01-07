# Docker image with utilities for Deployment of Websites

Hey there! This is a very opinionated Docker image with a couple of utilities personally needed to deploy websites to services such as Netlify or Vercel.


### Can I use this image?

If you need this image and you want to use it, feel free to do so, it's hosted in the Github Container Registry free for all and the tags are immutable (pinky promise).

Keep in mind that the images are versioned, and as such, you're highly encourage to use any of the specific versions, and potentially even pinning them. Otherwise, newer versions of the image might delete an application that you could be using. Still, this uses semantic versioning, and as such, I promise not to uninstall any apps in a minor or patch version. When an app goes away, it'll be in a major version change.

The `v0.x.x` versions are development versions, and as such, have no guarantees -- especially to maintaining an application inside the container or not.

### Can I suggest changes to this image?

Short answer: no.

Long answer: if the application fits the work I do with this image -- mainly to be used in CI pipelines -- then I would absolutely accept patches, changes or even new applications. Other than that, you're free to open a Github Issue to discuss it further, but in practice, I would rather keep the image stable.

You can always create your own, which is quite simple:

* Start from this image
* Add your files or apps
* And, if you want to publish your own copy, you can see [`.github/workflows/ci.yml`](.github/workflows/ci.yml) which you can copypasta to have a quick release to the registry.

#### Can I update an application version?

Short answer: no.

Long answer: same as above. Go versions are often easy to just update. NodeJS on the other hand can yield a plethora of issues, for example, newer versions of NodeJS might deprecate and prevent `node-gyp` from being installed and as such, a huge amount of packages will break. I wouldn't want that. However, if it's a fair decision, we can always discuss it in a Github issue.
