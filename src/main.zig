const std = @import("std");

pub fn main() void {
    const _stdout = std.io.getStdOut().writer();
    _stdout.print("stdout\n", .{}) catch return;
    std.debug.print("stderr\n", .{});

    const arr: [8]u64 = .{ 1, 2, 3, 4, 5, 6, 7, 8 };

    var bw = std.io.bufferedWriter(_stdout);
    const stdout = bw.writer();

    for (0..arr.len) |index| {
        stdout.print("arr[{}] = {};\n", .{ index, arr[index] }) catch return;
    }
    stdout.print("\n", .{}) catch return;
    bw.flush() catch return;
}
