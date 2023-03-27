module.exports = {
    branches: "master",
    repositoryUrl: "https://github.com/tezeh-ops/terraform-project2",
    plugins: [
      '@semantic-release/commit-analyzer',
      '@semantic-release/release-notes-generator',
      '@semantic-release/git',
      '@semantic-release/github']
 }