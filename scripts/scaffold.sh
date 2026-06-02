#!/bin/sh
# Memory Keel — Project Scaffold Script
# Usage: ./scaffold.sh <project-name>
#
# Creates a new project directory with the three core memory files:
#   product.md, deploy.md, lessons.md

set -e

if [ $# -eq 0 ]; then
    echo "Usage: ./scaffold.sh <project-name>"
    echo ""
    echo "Example:"
    echo "  ./scaffold.sh my-saas"
    echo "  ./scaffold.sh blog-tool"
    exit 1
fi

PROJECT_NAME="$1"
TEMPLATE_DIR="$(dirname "$0")/../template/project-alpha"

if [ ! -d "$TEMPLATE_DIR" ]; then
    echo "Error: Template directory not found at $TEMPLATE_DIR"
    echo "Make sure you're running this script from the memory-keel/scripts/ directory."
    exit 1
fi

echo "Creating memory-keel project: $PROJECT_NAME"

# Create project directory
mkdir -p "$PROJECT_NAME"

# Copy template files
cp "$TEMPLATE_DIR/product.md" "$PROJECT_NAME/product.md"
cp "$TEMPLATE_DIR/deploy.md" "$PROJECT_NAME/deploy.md"
cp "$TEMPLATE_DIR/lessons.md" "$PROJECT_NAME/lessons.md"

echo ""
echo "Done! Created:"
echo "  $PROJECT_NAME/"
echo "  $PROJECT_NAME/product.md"
echo "  $PROJECT_NAME/deploy.md"
echo "  $PROJECT_NAME/lessons.md"
echo ""
echo "Next steps:"
echo "  1. Edit $PROJECT_NAME/product.md — fill in your project details"
echo "  2. Edit $PROJECT_NAME/deploy.md — fill in your deployment info"
echo "  3. Start $PROJECT_NAME/lessons.md — add your first lesson"
echo "  4. Add '$PROJECT_NAME' to your memory-keel/INDEX.md"
echo "  5. Tell your AI agent to read memory-keel/INDEX.md at session start"
