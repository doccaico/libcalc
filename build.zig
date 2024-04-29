const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Dependencies
    // const libcalc_dep = b.dependency("libcalc", .{
    //     .optimize = optimize,
    //     .target = target,
    // });
    //
    // // Module
    // const libcalc_mod = b.addModule("calc", .{
    //     // .root_source_file = root_source_file,
    //     .target = target,
    //     .optimize = optimize,
    // });
    // libcalc_mod.addImport("libcalc", libcalc_dep.module("libcalc"));

    const libcalc = b.addStaticLibrary(.{
        .name = "libcalc",
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });

    libcalc.addCSourceFile(.{ .file = .{ .path = "src/calc.c" }, .flags = &.{} });
    // libcalc.addIncludePath(.{ .path = "libcalc/include" });
    libcalc.installHeadersDirectory(b.path("include/libcalc"), "libcalc", .{});
    // libcalc.installHeadersDirectory(b.path("libcalc/include/libcalc"), "libcalc", .{});

    b.installArtifact(libcalc);
}

// const std = @import("std");
//
// pub fn build(b: *std.Build) void {
//     const target = b.standardTargetOptions(.{});
//     const optimize = b.standardOptimizeOption(.{});
//
//     const libcalc = b.addStaticLibrary(.{
//         .name = "libcalc-zig",
//         .target = target,
//         .optimize = optimize,
//         .link_libc = true,
//     });
//
//     libcalc.addCSourceFile(.{ .file = .{ .path = "libcalc/src/calc.c" }, .flags = &.{} });
//     // libcalc.addIncludePath(.{ .path = "libcalc/include" });
//     // libcalc.installHeadersDirectory(b.path("libcalc/include"), "libcalc", .{});
//     libcalc.installHeadersDirectory(b.path("libcalc/include/libcalc"), "libcalc", .{});
//
//     b.installArtifact(libcalc);
// }
