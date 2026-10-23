# minirev

Minirev is a minimal reverse port forwarding implementation for Android. It works without root when run via [ADB](http://developer.android.com/tools/help/adb.html) and should work on pretty much any SDK level.

## Building

Building requires [NDK](https://developer.android.com/tools/sdk/ndk/index.html), and is known to work with at least with NDK Revision 10 (July 2014).

Then it's simply a matter of invoking `ndk-build`.

```
ndk-build
```

You should now have the binaries available in `./libs`.

## Releasing

The binaries are published to npm as [`@devicefarmer/minirev-prebuilt`](https://www.npmjs.com/package/@devicefarmer/minirev-prebuilt) by two GitHub Actions workflows:

1. Run `Prepare release` with the version as input, for example `1.1.0`. It bumps `package.json`, writes the `CHANGELOG.md` section from GitHub's generated notes, and pushes `release/v1.1.0`. It writes nothing to `master`.
2. Open the pull request it links to in the job summary, label it `ignore-for-release`, and merge it once the checks pass.
3. Run `Release` on `master` with the same version. It tags `v1.1.0`, publishes the GitHub release with the notes from `CHANGELOG.md`, then builds the binaries and publishes them to npm with trusted publishing (OIDC), so no npm token is stored anywhere.

The bump goes through a pull request because `master` is protected. `Release` refuses to run on any branch but `master`, so an unmerged `release/v*` branch cannot be published.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

See [LICENSE](LICENSE).

Copyright © CyberAgent, Inc. All Rights Reserved.
