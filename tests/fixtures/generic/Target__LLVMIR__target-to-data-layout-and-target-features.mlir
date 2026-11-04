"builtin.module"() ({
^bb0:
}) {llvm.target = #llvm.target<triple = "x86_64-unknown-linux", chip = "">} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {llvm.target = #llvm.target<triple = "x86_64-unknown-linux", chip = "", features = <["+mmx", "+sse"]>>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {llvm.target = #llvm.target<triple = "x86_64-unknown-linux", chip = "skylake">} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {llvm.target = #llvm.target<triple = "x86_64-unknown-linux", chip = "skylake", features = <["-sse", "-avx"]>>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {dlti.dl_spec = #dlti.dl_spec<index = 32 : i64>, llvm.target = #llvm.target<triple = "x86_64-unknown-linux", chip = "skylake", features = <["-mmx", "+avx512f"]>>} : () -> ()

