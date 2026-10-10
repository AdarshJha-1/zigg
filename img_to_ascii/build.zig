const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const zigimg_dependency = b.dependency("zigimg", .{
        .target = target,
        .optimize = optimize,
    });

    const exe = b.addExecutable(.{
        .name = "img_to_ascii",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{
                    .name = "zigimg",
                    .module = zigimg_dependency.module("zigimg"),
                },
            },
        }),
    });
    b.installArtifact(exe);
    const run_step = b.step("run", "Run the application");
    const run_cmd = b.addRunArtifact(exe);

    run_step.dependOn(&run_cmd.step);

}
