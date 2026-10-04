1. Create the Workflows Directory:
Run this command to create the required hidden folders for GitHub Actions in your project root:
    mkdir -p .github/workflows

2. Create the Configuration File:
Create a new file named ci.yml inside that directory:
    touch .github/workflows/ci.yml

3. Add the YAML Code:
Open ci.yml in your code editor and paste the following configuration. This script uses the modern v4 checkout, the standard dtolnay toolchain, and the caching mechanism discussed earlier to speed up your builds:

name: Rust CI Pipeline

on:
  push:
    branches: [ "main", "master" ]
  pull_request:
    branches: [ "main", "master" ]

jobs:
  build-and-test:
    name: Format, Lint, Test, and Build
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Set up Rust Toolchain
        uses: dtolnay/rust-toolchain@stable
        with:
          components: rustfmt, clippy

      - name: Enable Rust Cache
        uses: Swatinem/rust-cache@v2

      - name: Check Formatting
        run: make format

      - name: Run Linter
        run: make lint

      - name: Execute Tests
        run: make test

      - name: Build Project
        run: make build

4. Push to Trigger the Pipeline:
Commit these new files to your repository and push them to GitHub. The moment the code hits the remote server, GitHub Actions will detect the .github/workflows/ci.yml file and spin up the CI runner.
git add .github/workflows/ci.yml
git commit -m "chore: add github actions ci pipeline"
git push origin main
