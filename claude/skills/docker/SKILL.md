---
name: docker
description: Dockerfile and container image conventions for building lean, secure images
---

When writing a Dockerfile, Containerfile, etc, prefer multi-stage builds to
keep build and setup tools out of the final image. Final images should be lean
and secure.
