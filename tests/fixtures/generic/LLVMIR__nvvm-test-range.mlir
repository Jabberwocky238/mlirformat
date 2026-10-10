"builtin.module"() ({
  "gpu.module"() <{sym_name = "module"}> ({
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "nvvm.read.ptx.sreg.tid.x"() <{range = #llvm.constant_range<i32, 0, 32>}> : () -> i32
      %1 = "nvvm.read.ptx.sreg.tid.y"() <{range = #llvm.constant_range<i32, 0, 128>}> : () -> i32
      %2 = "nvvm.read.ptx.sreg.tid.z"() <{range = #llvm.constant_range<i32, 0, 4>}> : () -> i32
      %3 = "arith.constant"() <{value = 64 : i32}> : () -> i32
      %4 = "arith.cmpi"(%0, %3) <{predicate = 4 : i64}> : (i32, i32) -> i1
      "scf.if"(%4) ({
        "gpu.printf"() <{format = "threadidx"}> : () -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      %5 = "arith.cmpi"(%1, %3) <{predicate = 4 : i64}> : (i32, i32) -> i1
      "scf.if"(%5) ({
        "gpu.printf"() <{format = "threadidy"}> : () -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      %6 = "arith.cmpi"(%2, %3) <{predicate = 4 : i64}> : (i32, i32) -> i1
      "scf.if"(%6) ({
        "gpu.printf"() <{format = "threadidz"}> : () -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "kernel_1", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

