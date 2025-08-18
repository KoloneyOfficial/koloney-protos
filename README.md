# Koloney Protos

This repository contains Protocol Buffer definitions for the Koloney project.

## Project Structure

```
.
├── buf.yaml              # Main buf configuration
├── buf.gen.yaml          # Code generation configuration
├── go.mod                # Go module file
├── proto/                # Protocol buffer definitions
│   └── koloney/          # API definitions
│       └── koloney.proto
├── v1/                   # Generated code by language
│   ├── go/               # Generated Go files
│   ├── py/               # Generated Python files
│   └── js/               # Generated JavaScript/TypeScript files
```

## Prerequisites

- Install [buf](https://buf.build/docs/installation)
- Install Go 1.21+

## Usage

### Generate Code

To generate Go code from the protobuf definitions:

```bash
buf generate
```

This will create the `gen/` directory with generated Go files.

### Lint Protobuf Files

To check for linting issues:

```bash
buf lint
```

### Check for Breaking Changes

To check for breaking changes:

```bash
buf breaking --against '.git#branch=main'
```

### Update Dependencies

To update dependencies:

```bash
buf mod update
```

### Format Protobuf Files

To format protobuf files:

```bash
buf format -w
```

## Adding New Protobuf Files

1. Create new `.proto` files in the `proto/koloney/v1/` directory
2. Follow the existing naming conventions
3. Run `buf generate` to regenerate code
4. Commit both the `.proto` files and generated code

## Dependencies

- `buf.build/googleapis/googleapis` - Google API common protobuf definitions
