const std = @import("std");
const zigimg = @import("zigimg");

pub fn main(init: std.process.Init) !void {
    var buffer: [zigimg.io.DEFAULT_BUFFER_SIZE]u8 = undefined;
    var img = try zigimg.Image.fromFilePath(init.gpa, init.io, "assets/img1.jpeg", &buffer);
    defer img.deinit(init.gpa);
    std.debug.print("working...\n", .{});
}

