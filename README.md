# SessionBloom — Desktop

> A productivity app for designing custom focus sessions — take a block of time, partition it into work and break sub-blocks however you like, hit start, and let it run.

The user picks a chunk of time (say, 2 hours), splits it into sub-blocks as they please — e.g. 60 min focus → 15 min break → the rest on something else — then starts a timer that runs the whole sequence automatically, firing an audio cue at each transition so you know when a block starts or ends.

This repository contains the **desktop frontend**, built in Flutter. It's a personal project built to practice production-grade patterns and best practices end to end.

---

## Tech stack

| Layer | Technology |
|---|---|
| Framework | Flutter |
| Design system | Material Design |
| Language | Dart |
| Backend API | Flask + PostgreSQL ([session_bloom_api](https://github.com/KrisXVII/session_bloom_api)) |

## Features

- Design a session by splitting a time block into custom work/break sub-blocks
- Automatic sequencing — the timer advances through blocks on its own
- Audio cues at every transition (block start / block end)
- Talks to the SessionBloom API over a secure (mTLS) connection

## Project status

🚧 **Work in progress.** Registration flow implemented, core session feature development ongoing.

## Related repositories

- **Backend + infrastructure (Flask):** https://github.com/KrisXVII/session_bloom_api
