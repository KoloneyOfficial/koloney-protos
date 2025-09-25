# Koloney Protos

This repository contains Protocol Buffer definitions for the Koloney project.

## Project Structure

```
.
├── buf.yaml              # Main buf configuration
├── buf.gen.yaml          # Code generation configuration
├── buf.lock              # Dependency lock file
├── go.mod                # Go module file
├── go.sum                # Go module checksums
├── Makefile              # Build automation
├── koloney/              # Protocol buffer definitions
│   ├── application/v1/   # Application management API
│   │   ├── entities.proto
│   │   └── service.proto
│   ├── candidate/v1/     # Candidate management API
│   │   └── entities.proto
│   ├── company/v1/       # Company management API
│   │   ├── entities.proto
│   │   └── service.proto
│   ├── job/v1/           # Job management API
│   │   ├── entities.proto
│   │   └── service.proto
│   ├── koloney/v1/        # Core Koloney API
│   │   └── service.proto
│   ├── payment/v1/       # Payment processing API
│   │   └── entities.proto
│   └── user/v1/           # User management API
│       ├── entities.proto
│       └── service.proto
├── go/                   # Generated Go files
│   └── v1/
├── py/                   # Generated Python files
│   └── v1/
└── ts/                   # Generated TypeScript files
    └── v1/
```

## Prerequisites

- Install [buf](https://buf.build/docs/installation)
- Install Go 1.21+

## Package Structure

The protobuf files are organized by service domain with versioning:

- **Package Names**: `koloney.{service}.v1` (e.g., `koloney.application.v1`)
- **Directory Structure**: `koloney/{service}/v1/` (e.g., `koloney/application/v1/`)
- **File Naming**: `entities.proto` for data models, `service.proto` for RPC definitions

### Services

- **Application**: Job application management
- **Candidate**: Candidate profile and data management  
- **Company**: Company profile and verification
- **Job**: Job posting and management
- **Koloney**: Core financial operations
- **Payment**: Payment processing and transactions
- **User**: User account management

## Usage

### Available Commands

Use the Makefile for common operations:

```bash
make help              # Show all available commands
make generate          # Generate code for all languages (Go, Python, TypeScript)
make lint              # Lint protobuf files
make check             # Check for breaking changes
make format            # Format protobuf files
make clean             # Clean generated files
make dev               # Full development workflow: clean, generate, and lint
```

### Generate Code

To generate code from the protobuf definitions:

```bash
make generate
```

This will generate code for Go, Python, and TypeScript in their respective directories.

### Lint Protobuf Files

To check for linting issues:

```bash
make lint
```

### Check for Breaking Changes

To check for breaking changes:

```bash
make check
```

### Format Protobuf Files

To format protobuf files:

```bash
make format
```

## Adding New Protobuf Files

1. Create new `.proto` files in the appropriate `koloney/{service}/v1/` directory
2. Follow the existing naming conventions:
   - Use `entities.proto` for data models and enums
   - Use `service.proto` for RPC service definitions
   - Use package name `koloney.{service}.v1`
3. Run `make generate` to regenerate code
4. Run `make lint` to check for any issues
5. Commit both the `.proto` files and generated code

### Example

To add a new service called `notification`:

1. Create directory: `koloney/notification/v1/`
2. Create `entities.proto` with package `koloney.notification.v1`
3. Create `service.proto` with package `koloney.notification.v1`
4. Run `make generate` and `make lint`

## Linting Configuration

The project uses buf's STANDARD linting rules with the following exceptions:

- `PACKAGE_DIRECTORY_MATCH`: Disabled to allow flexible package naming
- `PACKAGE_VERSION_SUFFIX`: Disabled to allow custom versioning

This configuration allows for the current package structure while maintaining code quality standards.

## Best Practices

- **Package Naming**: Use `koloney.{service}.v1` format
- **Directory Structure**: Match package structure with `koloney/{service}/v1/`
- **RPC Responses**: Use dedicated response message types instead of returning entities directly
- **File Organization**: Separate entities and services into different files
- **Import Paths**: Use full paths relative to project root (e.g., `koloney/application/v1/entities.proto`)

## Dependencies

- `buf.build/googleapis/googleapis` - Google API common protobuf definitions
