# Full Feature Development Command

## Command
```
/full-feature "{feature_name}"
```

## Description
Orchestrates complete feature development from planning to deployment using all relevant agents.

## Usage Examples
```
/full-feature "user authentication"
/full-feature "contact import from Google"
/full-feature "AI message suggestions"
/full-feature "birthday reminders"
```

## Workflow
```
1. PLANNING (Parallel)
   ├── flutter-architect: Architecture design
   ├── backend-architect: API design
   └── privacy-architect: Data flow review

2. DATABASE
   └── database-designer: Schema changes

3. BACKEND (Parallel)
   ├── api-developer: Cloud Functions
   └── security-auditor: Security review

4. FRONTEND (Parallel)
   ├── flutter-architect: Feature implementation
   ├── ui-designer: UI components
   └── state-manager: State management

5. AI INTEGRATION (if needed)
   ├── ai-architect: AI features
   └── nlp-engineer: Text processing

6. TESTING (Parallel)
   ├── test-architect: Test strategy
   └── qa-automation: Test implementation

7. REVIEW (Parallel)
   ├── code-reviewer: Code quality
   ├── security-auditor: Security check
   └── privacy-architect: Privacy check

8. DEPLOYMENT
   └── devops-engineer: CI/CD and deploy
```

## Output
- Feature specification document
- Database migrations
- Backend API code
- Frontend Flutter code
- Test suites
- Deployment logs

## Options
```
--skip-ai        Skip AI integration stage
--skip-tests     Skip testing (not recommended)
--dry-run        Plan only, don't execute
--priority=high  Fast-track development
```
