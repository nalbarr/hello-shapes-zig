const std = @import("std");
const print = std.debug.print;

// Shape interface - any type that implements area() can be a Shape
pub const Shape = struct {
    ptr: *anyopaque,
    areaFn: *const fn (ptr: *anyopaque) f64,

    pub fn area(self: Shape) f64 {
        return self.areaFn(self.ptr);
    }
};

// Square struct
pub const Square = struct {
    side: f64,

    pub fn area(self: *Square) f64 {
        return self.side * self.side;
    }

    pub fn shape(self: *Square) Shape {
        return Shape{
            .ptr = self,
            .areaFn = areaImpl,
        };
    }

    fn areaImpl(ptr: *anyopaque) f64 {
        const self: *Square = @ptrCast(@alignCast(ptr));
        return self.area();
    }
};

// Circle struct
pub const Circle = struct {
    radius: f64,

    pub fn area(self: *Circle) f64 {
        return std.math.pi * self.radius * self.radius;
    }

    pub fn shape(self: *Circle) Shape {
        return Shape{
            .ptr = self,
            .areaFn = areaImpl,
        };
    }

    fn areaImpl(ptr: *anyopaque) f64 {
        const self: *Circle = @ptrCast(@alignCast(ptr));
        return self.area();
    }
};

// Triangle struct
pub const Triangle = struct {
    base: f64,
    height: f64,

    pub fn area(self: *Triangle) f64 {
        return 0.5 * self.base * self.height;
    }

    pub fn shape(self: *Triangle) Shape {
        return Shape{
            .ptr = self,
            .areaFn = areaImpl,
        };
    }

    fn areaImpl(ptr: *anyopaque) f64 {
        const self: *Triangle = @ptrCast(@alignCast(ptr));
        return self.area();
    }
};

// Rectangle struct (local scope, similar to Go version)
pub const Rectangle = struct {
    base: f64,
    height: f64,

    pub fn area(self: *Rectangle) f64 {
        return self.base * self.height;
    }

    pub fn shape(self: *Rectangle) Shape {
        return Shape{
            .ptr = self,
            .areaFn = areaImpl,
        };
    }

    fn areaImpl(ptr: *anyopaque) f64 {
        const self: *Rectangle = @ptrCast(@alignCast(ptr));
        return self.area();
    }
};

// Generic function to get area of any shape (equivalent to Go's getArea function)
fn getArea(shape: Shape) void {
    print("Shape area: {d:.6}\n", .{shape.area()});
}

fn bar() void {
    print("Bar function called!\n", .{});
}

pub fn main() !void {
    print("hello, shapes\n", .{});
    
    bar();

    var square = Square{ .side = 4.0 };
    var circle = Circle{ .radius = 3.0 };
    var triangle = Triangle{ .base = 3.0, .height = 5.0 };

    var rectangle = Rectangle{ .base = 3.0, .height = 5.0 };

    // NOTE: Functional thinking pattern
    // - FP: function applied to data structure
    // instead of
    // - OOP: object instance + behavior/method call requiring state
    // to be passed to private fields via constructor

    getArea(square.shape());
    getArea(circle.shape());
    getArea(triangle.shape());
    getArea(rectangle.shape());
}
