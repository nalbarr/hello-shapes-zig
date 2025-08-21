const std = @import("std");
const testing = std.testing;

// Import the shapes from main.zig
const main = @import("main.zig");
const Square = main.Square;
const Circle = main.Circle;
const Triangle = main.Triangle;
const Rectangle = main.Rectangle;

test "square area calculation" {
    var square = Square{ .side = 4.0 };
    try testing.expectEqual(@as(f64, 16.0), square.area());
}

test "square area with different dimensions" {
    var square1 = Square{ .side = 5.0 };
    var square2 = Square{ .side = 2.5 };
    
    try testing.expectEqual(@as(f64, 25.0), square1.area());
    try testing.expectEqual(@as(f64, 6.25), square2.area());
}

test "circle area calculation" {
    var circle = Circle{ .radius = 3.0 };
    const expected = std.math.pi * 9.0;
    try testing.expectApproxEqRel(expected, circle.area(), 0.0001);
}

test "circle area with different radii" {
    var circle1 = Circle{ .radius = 1.0 };
    var circle2 = Circle{ .radius = 5.0 };
    
    try testing.expectApproxEqRel(std.math.pi, circle1.area(), 0.0001);
    try testing.expectApproxEqRel(std.math.pi * 25.0, circle2.area(), 0.0001);
}

test "triangle area calculation" {
    var triangle = Triangle{ .base = 3.0, .height = 5.0 };
    try testing.expectEqual(@as(f64, 7.5), triangle.area());
}

test "triangle area with different dimensions" {
    var triangle1 = Triangle{ .base = 10.0, .height = 4.0 };
    var triangle2 = Triangle{ .base = 6.0, .height = 8.0 };
    
    try testing.expectEqual(@as(f64, 20.0), triangle1.area());
    try testing.expectEqual(@as(f64, 24.0), triangle2.area());
}

test "rectangle area calculation" {
    var rectangle = Rectangle{ .base = 3.0, .height = 5.0 };
    try testing.expectEqual(@as(f64, 15.0), rectangle.area());
}

test "rectangle area with different dimensions" {
    var rectangle1 = Rectangle{ .base = 7.0, .height = 2.0 };
    var rectangle2 = Rectangle{ .base = 4.5, .height = 6.0 };
    
    try testing.expectEqual(@as(f64, 14.0), rectangle1.area());
    try testing.expectEqual(@as(f64, 27.0), rectangle2.area());
}

test "shape interface polymorphism" {
    var square = Square{ .side = 4.0 };
    var circle = Circle{ .radius = 3.0 };
    var triangle = Triangle{ .base = 3.0, .height = 5.0 };
    var rectangle = Rectangle{ .base = 3.0, .height = 5.0 };
    
    const square_shape = square.shape();
    const circle_shape = circle.shape();
    const triangle_shape = triangle.shape();
    const rectangle_shape = rectangle.shape();
    
    try testing.expectEqual(@as(f64, 16.0), square_shape.area());
    try testing.expectApproxEqRel(std.math.pi * 9.0, circle_shape.area(), 0.0001);
    try testing.expectEqual(@as(f64, 7.5), triangle_shape.area());
    try testing.expectEqual(@as(f64, 15.0), rectangle_shape.area());
}

test "zero dimensions edge cases" {
    var zero_square = Square{ .side = 0.0 };
    var zero_circle = Circle{ .radius = 0.0 };
    var zero_triangle = Triangle{ .base = 0.0, .height = 5.0 };
    var zero_rectangle = Rectangle{ .base = 0.0, .height = 5.0 };
    
    try testing.expectEqual(@as(f64, 0.0), zero_square.area());
    try testing.expectEqual(@as(f64, 0.0), zero_circle.area());
    try testing.expectEqual(@as(f64, 0.0), zero_triangle.area());
    try testing.expectEqual(@as(f64, 0.0), zero_rectangle.area());
}
