# LoudsaInternal

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

### Integration tests

  * Located in `cypress/integrations`
  * Run with `npx cypress open`

### Branching strategy

  * `master` is the production branch, (TODO: push to master should trigger CI
    and deploy)
  * `release-X.X` is the current release integration branch, feature branches
    should branch from here
  * `patch-X.X.X` is an integration branch for a bugfix. For small bugs, ok to
    commit directly, for larger bugs use as a proper integration branch
  * `dev` is the integration branch for testing
  * feature/bugfix branches should be named `X-feature-name` where `X` is the number
    of an issue descibing the feature/bug

### PR Checklist

  PR's to a release branch should contain this completed checklist:

  - [ ]  new functions have unit tests
  - [ ] `mix test` returns 0
  - [ ] `mix credo --strict` returns 0
  - [ ] new features have integration tests
  - [ ] all cypress integration tests are green

  (TODO: automate this in CI)
