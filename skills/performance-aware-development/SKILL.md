---
name: performance-aware-development
description: Analyze algorithmic, data-access, memory, and UI rendering costs while implementing or reviewing application code.
---

# Performance-aware development

Use this skill when a change processes collections, accesses storage or remote
services, renders lists or components, or may affect latency, throughput, or
resource usage.

- Estimate time and space complexity for the changed path. Look for repeated
  scans, nested loops, unnecessary copies, unbounded growth, and avoidable
  recomputation.
- Match data structures to the dominant operations instead of defaulting to a
  convenient structure.
- Inspect database and remote access for queries inside loops, oversized result
  sets, missing filtering or pagination, duplicate requests, and avoidable
  round trips.
- In React or similar reactive UIs, inspect state, props, context, effects,
  derived values, list keys, and component boundaries for avoidable renders or
  repeated work. Do not add memoization without a reason.
- Treat a concrete performance defect as a blocking finding. Treat an unconfirmed
  suspicion as a hypothesis with the measurement needed to confirm it.
- Use static reasoning first. Use query plans, counters, profiling, benchmarks,
  or render instrumentation when the decision depends on real workload.
- Prefer the simplest design that is efficient for the expected use. Do not
  optimize unrelated code or add caches, indexes, workers, or complexity without
  evidence and a clear invalidation or ownership strategy.
