# Oracle PL/SQL & Database Code Review Guide

## Overview
This repository contains a structured checklist and guidelines for conducting peer code reviews on Oracle PL/SQL scripts, database packages, and SQL queries. It is designed to enforce performance standards, security protocols, and clean code practices.

## Key Focus Areas
- **Performance:** Bulk operations (`FORALL`, `BULK COLLECT`), index utilization, avoiding `SELECT *`.
- **Security:** Preventing SQL injection, managing privilege grants, handling sensitive data.
- **Maintainability:** Standardized naming conventions, exception handling, consistent formatting.

## Included Files
- `code_review_checklist.sql`: Sample database package demonstrating standard vs. non-standard PL/SQL code practices.
- `CHECKLIST.md`: Step-by-step checklist for reviewers during sprint code reviews.
