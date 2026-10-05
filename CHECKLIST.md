# PL/SQL Code Review Checklist

Use this checklist during code review sessions before merging changes into the main branch.

### 1. Performance & Memory
- [ ] Are cursor loops replaced with bulk collection (`BULK COLLECT` / `FORALL`) where applicable?
- [ ] Are `WHERE` clause columns indexed properly?
- [ ] Are redundant queries minimized inside loops?

### 2. Error Handling & Security
- [ ] Is exception handling implemented without silent `WHEN OTHERS THEN NULL` blocks?
- [ ] Are bind variables used to prevent SQL injection vulnerabilities?
- [ ] Are table grants restricted to least-privilege access?

### 3. Maintainability & Style
- [ ] Are naming conventions followed (e.g., `p_` for parameters, `v_` for local variables)?
- [ ] Is complex logic documented with inline comments?
- [ ] Are SQL statements explicitly listing columns instead of using `SELECT *`?
