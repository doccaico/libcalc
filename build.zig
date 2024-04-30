const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "calc",
        .target = target,
        .optimize = optimize,
    });
    // lib.addIncludePath(.{ .path = "include" });
    lib.addCSourceFiles(.{
        .files = &.{
            "src/calc.c",
            // "src/framing.c",
        },
        .flags = &.{
            // "-std=c99",
        },
    });
    lib.linkLibC();
    lib.installHeadersDirectory(.{ .path = "include/libcalc" }, "libcalc", .{});
    b.installArtifact(lib);
}
