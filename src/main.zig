const std = @import("std");

fn Tensor(comptime Scalar: type) type {
    return struct {
        buffer: []Scalar,

        fn init(allocator: std.mem.Allocator, size: usize) std.mem.Allocator.Error!@This() {
            return .{
                .buffer = try allocator.alloc(Scalar, size),
            };
        }
    };
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    const a = try Tensor(f64).init(allocator, 10);

    std.debug.print("{}", .{a});
}
