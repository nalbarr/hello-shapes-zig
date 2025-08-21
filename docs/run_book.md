# Hack Zig - Run Book

This document provides comprehensive instructions for running and testing the Zig shapes program that replicates the functionality of the Go hello-shapes-go project.

## Project Overview

This project implements a shapes system in Zig that demonstrates:
- Polymorphic Shape interface using function pointers
- Geometric shapes (Square, Circle, Triangle, Rectangle) with area calculations
- Generic functions that work with any shape type
- Functional programming patterns

## Project Structure

```
hack-zig/
├── src/
│   ├── main.zig          # Main program with shapes implementation
│   └── shapes_test.zig   # Comprehensive test suite (10 tests)
├── docs/
│   └── run_book.md       # This documentation
├── build.zig             # Build configuration
├── build.zig.zon         # Build dependencies
└── Makefile              # Make targets for convenience
```

## Prerequisites

- Zig compiler (version 0.14.1 or compatible)
- Make (optional, for convenience commands)

## Running the Program

### Method 1: Using Zig Build (Recommended)

```bash
# Build and run the program
zig build run
```

**Expected Output:**
```
hello, shapes
Bar function called!
Shape area: 16.000000
Shape area: 28.274334
Shape area: 7.500000
Shape area: 15.000000
```

### Method 2: Using Make

```bash
# Build the program
make build

# Run the built executable
make run
```

### Method 3: Direct Compilation

```bash
# Compile directly
zig build

# Run the executable
./zig-out/bin/hack_zig
```

## Testing the Program

### Running All Tests

#### Method 1: Build System Tests
```bash
# Run tests through the build system
zig build test
```

#### Method 2: Direct Test Execution
```bash
# Run the separate test file directly
zig test src/shapes_test.zig
```

**Expected Test Output:**
```
All 10 tests passed.
```

### Test Coverage

The test suite (`src/shapes_test.zig`) includes:

1. **Basic Area Calculations:**
   - Square area calculation
   - Circle area calculation  
   - Triangle area calculation
   - Rectangle area calculation

2. **Multiple Dimensions Testing:**
   - Square with different side lengths
   - Circle with different radii
   - Triangle with different base/height combinations
   - Rectangle with different dimensions

3. **Polymorphism Testing:**
   - Shape interface functionality
   - Generic area calculation through interface

4. **Edge Cases:**
   - Zero dimension handling
   - Boundary value testing

### Individual Test Categories

```bash
# Run specific test patterns (if needed for debugging)
zig test src/shapes_test.zig --test-filter "square"
zig test src/shapes_test.zig --test-filter "circle"
zig test src/shapes_test.zig --test-filter "triangle"
zig test src/shapes_test.zig --test-filter "rectangle"
```

## Development Workflow

### 1. Make Changes
Edit `src/main.zig` for implementation changes or `src/shapes_test.zig` for test modifications.

### 2. Test Changes
```bash
# Quick test run
zig test src/shapes_test.zig

# Full build and test
zig build test
```

### 3. Run Program
```bash
# Verify program still works
zig build run
```

### 4. Clean Build (if needed)
```bash
# Clean build cache
rm -rf .zig-cache zig-out

# Fresh build
zig build
```

## Troubleshooting

### Common Issues

1. **Build Errors:**
   ```bash
   # Clean and rebuild
   rm -rf .zig-cache zig-out
   zig build
   ```

2. **Test Failures:**
   ```bash
   # Run tests with verbose output
   zig test src/shapes_test.zig --verbose
   ```

3. **Missing Dependencies:**
   - Ensure Zig is properly installed
   - Check Zig version compatibility: `zig version`

### Debug Mode

```bash
# Build in debug mode (default)
zig build -Doptimize=Debug

# Build in release mode
zig build -Doptimize=ReleaseFast
```

## Performance Testing

```bash
# Build optimized version
zig build -Doptimize=ReleaseFast

# Time the execution
time ./zig-out/bin/hack_zig
```

## Code Analysis

### Static Analysis
```bash
# Check for unused variables, etc.
zig build --verbose
```

### Memory Safety
Zig provides compile-time memory safety checks. The build process will catch:
- Memory leaks
- Buffer overflows
- Use-after-free errors

## Integration with Original Go Project

This Zig implementation replicates the functionality of:
- **Original Go Project:** https://github.com/nalbarr/hello-shapes-go/blob/master/main.go

### Functional Equivalence

| Go Feature | Zig Implementation |
|------------|-------------------|
| `shapes.Shape` interface | `Shape` struct with function pointers |
| `getArea(x shapes.Shape)` | `getArea(shape: Shape)` |
| `foo.Bar()` | `bar()` function |
| Shape structs | Public structs with area methods |
| Polymorphic calls | Interface-based polymorphism |

## Makefile Targets

If using the provided Makefile:

```bash
make build    # Build the project
make run      # Run the executable
make test     # Run tests
make clean    # Clean build artifacts
```

## Continuous Integration

For CI/CD pipelines:

```bash
#!/bin/bash
# CI script example
set -e

# Build
zig build

# Test
zig build test
zig test src/shapes_test.zig

# Run
zig build run

echo "All checks passed!"
```

## Additional Resources

- [Zig Documentation](https://ziglang.org/documentation/)
- [Original Go Project](https://github.com/nalbarr/hello-shapes-go)
- [Zig Build System](https://ziglang.org/learn/build-system/)
