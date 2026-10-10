pub const packages = struct {
    pub const @"zigimg-0.1.0-8_eo2sBLGACBebrhQZUwRliZNSUyDn6szp99eip_6-Rw" = struct {
        pub const build_root = "zig-pkg/zigimg-0.1.0-8_eo2sBLGACBebrhQZUwRliZNSUyDn6szp99eip_6-Rw";
        pub const build_zig = @import("zigimg-0.1.0-8_eo2sBLGACBebrhQZUwRliZNSUyDn6szp99eip_6-Rw");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
};

pub const root_deps: []const struct { []const u8, []const u8 } = &.{
    .{ "zigimg", "zigimg-0.1.0-8_eo2sBLGACBebrhQZUwRliZNSUyDn6szp99eip_6-Rw" },
};
