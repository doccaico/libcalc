#### Usage

On terminal

```
$ zig fetch --save=libcalc https://github.com/doccaico/libcalc-zig/archive/<HASH>.tar.gz
```

```zig
// build.zig

const libcalc_dep = b.dependency("libcalc", .{ .target = target, .optimize = optimize });
exe.linkLibrary(libcalc_dep.artifact("libcalc-zig"));

// main.zig

const std = @import("std");
const c = @cImport({
    @cInclude("libcalc/calc.h");
});

pub fn main() void {
    std.debug.print("{d}\n", .{c.add(1, 2)});
    std.debug.print("{d}\n", .{c.sub(10, 3)});
}
```
