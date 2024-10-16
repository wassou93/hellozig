const std = @import("std");

const u8_u16 = union {
    var1: u8,
    var2: u16,
};

pub fn main() void {
    // Optionals
    var optional_value: ?[]const u8 = null;
    std.debug.assert(optional_value == null);
    std.debug.print("\noptional 1\ntype: {}\nvalue: {?s}\n", .{ @TypeOf(optional_value), optional_value });
    optional_value = "hi";
    std.debug.assert(optional_value != null);
    std.debug.print("\noptional 1\ntype: {}\nvalue: {?s}\n", .{ @TypeOf(optional_value), optional_value });

    // Error unions
    var number_or_error: anyerror!i32 = error.ArgNotFound;

    std.debug.print("\nerror union 1\ntype: {}\nvalue: {!}\n", .{
        @TypeOf(number_or_error),
        number_or_error,
    });

    number_or_error = 1234;

    std.debug.print("\nerror union 1\ntype: {}\nvalue: {!}\n", .{
        @TypeOf(number_or_error),
        number_or_error,
    });

    var u8_or_u16: u8_u16 = .{ .var1 = 12 };
    std.debug.print("\nu8_or_u16 type is {} and value is {!}\n", .{ @TypeOf(u8_or_u16), u8_or_u16 });
    u8_or_u16 = .{ .var2 = 1200 };
    std.debug.print("\nu8_or_u16 type is {} and value is {!}\n", .{ @TypeOf(u8_or_u16), u8_or_u16 });

    std.debug.print("\nthis -> {s}\n\n", .{do_something() catch {}});
}

fn do_something() ![]const u8 {
    return "[]u8 returned from do_something()";
}
