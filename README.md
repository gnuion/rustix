# ❄️ Rustix
> Nix Powered Rust Template

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

- ❄️ Declarative Environments with [Nix](https://nixos.org/)
- 🦀 Be safe with [Rust](https://www.rust-lang.org/)!
- 📦 Incremental and Reproducible builds with [crate2nix](https://github.com/nix-community/crate2nix)
- 🐳 Build Containers with Nix [dockerTools](https://nix.dev/tutorials/nixos/building-and-running-docker-images.html) 
- 🌈 Multi-platform
- 🔧 Make it your own!

## Overview

This project serves as a template for projects utilizing the Nix package manager and the Rust programming language. Nix provides a declarative and reproducible way to manage dependencies, environments, and builds across different platforms.

## Features

- **Declarative Configuration:** Leverage the power of declarative configuration to specify your project's dependencies and environment.

- **Reproducibility:** Ensure consistent and reproducible builds across different systems, reducing the "it works on my machine" problem.

- **Multi-language Support:** Nix supports a wide range of programming languages, making it suitable for diverse projects.

## Getting Started

Follow these steps to get your project up and running:

1. **Install Nix:**
   Ensure that Nix is installed on your system. Visit [Nix Installation Guide](https://nixos.org/guides/install-nix.html) for instructions.

2. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/your-project.git
   cd your-project
3. **Enter the Development Environment**
   ```bash
   nix develop
   ```
   Use cargo as normal.
4. **Regenerate Crate.nix during CI and build**
   ```bash
   crate2nix generate
   nix build
   ```


