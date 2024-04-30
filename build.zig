const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "libcalc",
        .target = target,
        .optimize = optimize,
    });

    lib.addCSourceFiles(.{
        .files = &.{
            "src/calc.c",
        },
        .flags = &.{},
    });

    lib.installHeadersDirectory(.{ .path = "include/libcalc" }, "libcalc", .{});
    lib.linkLibC();
    b.installArtifact(lib);
}
