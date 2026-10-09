const std = @import("std");
const Writer = std.Io.File.Writer;
pub fn main(init: std.process.Init) !void {
    // std.debug.print("Hello, World\n", .{});
    //
    // const age: u8 = 100;
    // std.debug.print("{d}", .{age});

    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = Writer.init(std.Io.File.stdout(), init.io, &stdout_buffer);

    const stdout = &stdout_writer.interface;
    const arr = [4]u8{ 1, 2, 3, 4 };

    try stdout.print("array idx: {d} -> val: {d}", .{ 1, arr[1] });
    try stdout.flush();
}
