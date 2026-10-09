const std = @import("std");

fn readFile(buffer: []u8, io: std.Io, path: []const u8) !usize {
    const file = try std.Io.Dir.cwd().openFile(io, path, .{});
    defer file.close(io);

    const nbytes = try file.readPositionalAll(io, buffer[0..], 0);
    return nbytes;
}

pub fn main(init: std.process.Init) !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var file_buffer = try allocator.alloc(u8, 1024);
    defer allocator.free(file_buffer);
    @memset(file_buffer[0..], 0);
    const path = "./test.txt";
    const nbytes = try readFile(file_buffer[0..], init.io, path);
    std.debug.print("{s}, total char -> {d}", .{file_buffer[0..nbytes], nbytes});
}
