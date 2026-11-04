module attributes {llvm.target = #llvm.target<triple = "x86_64-unknown-linux", chip = "">} {
}

// -----
module attributes {llvm.target = #llvm.target<triple = "x86_64-unknown-linux", chip = "", features = <["+mmx", "+sse"]>>} {
}

// -----
module attributes {llvm.target = #llvm.target<triple = "x86_64-unknown-linux", chip = "skylake">} {
}

// -----
module attributes {llvm.target = #llvm.target<triple = "x86_64-unknown-linux", chip = "skylake", features = <["-sse", "-avx"]>>} {
}

// -----
module attributes {dlti.dl_spec = #dlti.dl_spec<index = 32 : i64>, llvm.target = #llvm.target<triple = "x86_64-unknown-linux", chip = "skylake", features = <["-mmx", "+avx512f"]>>} {
}

