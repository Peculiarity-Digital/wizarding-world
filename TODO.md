# TODO

An overview of items todo to complete the Wizarding World API integration into Flutter

## Notes

No notes

### Sprint 0

- [x] Scaffold boilerplate application
- [x] Commit boilerplate application code to GitHub
- [x] Configure markdown files, `.github/` directory and associate code owner(s) to `/src`
- [x] Configure dependabot
- [x] Define the solution architecture (clean/ modular)
- [x] Bring in packages
  - [x] dio
  - [x] riverpod  
  - [x] build_runner
  - [x] freezed
- [x] Set up workflow to run test and analysis against the project

### Sprint 1

- [x] Result state objects
  - [x] Abstract
  - [x] Success
  - [x] Error

- [x] Use Cases
  - [x] GET Houses

- [x] Repositories
  - [x] HouseRepository

- [x] Providers
  - [x] HouseProvider

- [x] Pages
  - [x] Display all houses
  - [x] Drill into a single house detail view

### Sprint 2

- [ ] Use Cases  
  - [ ] GET Spells
  - [ ] GET Wizards
  - [ ] GET Elixirs
  - [ ] GET Ingredients

- [ ] Repositories  
  - [ ] SpellRepository
  - [ ] WizardRepository
  - [ ] ElixirRepository
  - [ ] IngredientRepository

- [ ] Providers  
  - [ ] SpellProvider
  - [ ] WizardProvider
  - [ ] ElixirProvider
  - [ ] IngredientProvider

- [x] Bottom Navigation
- [x] Routes
  - [x] Home/ Houses
  - [x] Elixirs
  - [x] Ingredients
  - [x] Spells
  - [x] Wizards

### Additional Tasks

- [ ] Set up workflow to build, at the very least:
  - [x] Windows
  - [ ] Linux
  - [ ] Android
- [ ] Semver update
- [ ] Create tag after successful test and analyze