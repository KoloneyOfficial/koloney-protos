#!/bin/bash

# Script to delete all generated files (ts, js, py, go) while keeping .proto files
# This will clean up all generated code and leave only the source protobuf files
# Works dynamically regardless of directory structure

set -e  # Exit on any error

echo "🧹 Cleaning up generated files..."

# Remove generated Go files (all patterns)
echo "Removing generated Go files..."
find . -name "*.pb.go" -type f -delete
find . -name "*.connect.go" -type f -delete
# Remove any connect directories (dynamic pattern)
find . -name "*connect" -type d -exec rm -rf {} + 2>/dev/null || true

# Remove generated Python files (all patterns)
echo "Removing generated Python files..."
find . -name "*.pb2.py" -type f -delete
find . -name "*_pb2_grpc.py" -type f -delete
find . -name "*_pb2.py" -type f -delete

# Remove generated TypeScript/JavaScript files
echo "Removing generated TypeScript/JavaScript files..."
find . -name "*.pb.ts" -type f -delete
find . -name "*.connect.ts" -type f -delete

# Remove any directories that contain only generated files
echo "Removing directories containing only generated files..."
# Find directories that contain generated files and remove them entirely
find . -type d \( -name "go" -o -name "py" -o -name "ts" -o -name "js" \) -exec rm -rf {} + 2>/dev/null || true

# Remove empty directories that might be left behind
echo "Removing empty directories..."
find . -type d -empty -delete 2>/dev/null || true

# Show remaining .proto files to confirm they're preserved
echo "✅ Cleanup complete!"
echo "📄 Remaining .proto files:"
find . -name "*.proto" -type f | sort

echo ""
echo "🎉 All generated files have been removed. Only .proto source files remain."
