# Contributing

Every kind of contribution is welcome: bug reports, questions, feature requests, documentation
fixes, new dialects, small typo PRs and large refactors alike. No template or prior discussion is
required — open an issue or a pull request whenever you like.

## Issues

Anything goes. For a bug, the MLIR text that fails and what you expected help the most.

## Pull requests

1. Fork the repository and branch from `main`.
2. Make your change.
3. Run the tests:

   ```sh
   cargo test --release -p mlirformat
   cargo test --manifest-path sampleplugin/Cargo.toml
   ```

4. Open the pull request. CI runs the same tests.

Unfinished or draft pull requests are fine too.

## License

By contributing, you agree that your contributions are licensed under the MIT License.
