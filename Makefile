# Koloney Protos Makefile
# Common tasks for protobuf development and code generation

.PHONY: help clean generate lint format check breaking install-deps test

# Default target
help: ## Show this help message
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

clean: ## Clean up all generated files using cleanup script
	@echo "🧹 Running cleanup script..."
	@bash .develop/cleanup.sh

generate: ## Generate protobuf code for all languages (Go, Python, TypeScript)
	@echo "🚀 Generating protobuf code..."
	@buf generate
	@echo "✅ Code generation complete!"

lint: ## Lint protobuf files
	@echo "🔍 Linting protobuf files..."
	@buf lint
	@echo "✅ Linting complete!"

format: ## Format protobuf files
	@echo "🎨 Formatting protobuf files..."
	@buf format -w
	@echo "✅ Formatting complete!"

check: ## Check protobuf files for issues
	@echo "🔍 Checking protobuf files..."
	@buf check lint
	@buf check breaking --against '.git#branch=main'
	@echo "✅ All checks passed!"

breaking: ## Check for breaking changes
	@echo "⚠️  Checking for breaking changes..."
	@buf check breaking --against '.git#branch=main'
	@echo "✅ Breaking change check complete!"

install-deps: ## Install buf dependencies
	@echo "📦 Installing buf dependencies..."
	@buf mod update
	@echo "✅ Dependencies updated!"

test: ## Run all tests and checks
	@echo "🧪 Running all tests and checks..."
	@$(MAKE) lint
	@$(MAKE) breaking
	@echo "✅ All tests passed!"

# Development workflow targets
dev: clean generate lint ## Full development workflow: clean, generate, and lint
	@echo "🎉 Development setup complete!"

ci: install-deps lint breaking ## CI workflow: install deps, lint, and check breaking changes
	@echo "✅ CI checks passed!"

# Quick targets
go: ## Generate only Go code
	@echo "🔧 Generating Go code..."
	@buf generate --template buf.gen.yaml --path go
	@echo "✅ Go code generation complete!"

py: ## Generate only Python code
	@echo "🐍 Generating Python code..."
	@buf generate --template buf.gen.yaml --path py
	@echo "✅ Python code generation complete!"

ts: ## Generate only TypeScript code
	@echo "📘 Generating TypeScript code..."
	@buf generate --template buf.gen.yaml --path ts
	@echo "✅ TypeScript code generation complete!"
