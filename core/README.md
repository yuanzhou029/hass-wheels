# Core Wheels Build Configuration

This directory contains configuration for building Python wheels for core packages using the custom wheels builder.

## Workflow Configuration

The `.github/workflows/wheels.yml` file configures:
- Python ABI versions: cp313, cp314
- Target platform: musllinux_1_2
- Architecture: amd64
- Builds packages locally and uploads as GitHub Artifacts

## Usage

The workflow:
1. Builds wheels for the specified packages
2. Saves them as GitHub Action artifacts
3. Makes them available for download after workflow completion

## Notes

- Update the `requirements.txt` path to point to your actual requirements file
- The built wheels will be compatible with musllinux environments
- No SSH key is required as wheels are stored as artifacts