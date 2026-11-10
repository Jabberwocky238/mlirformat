"builtin.module"() ({
  "gpu.module"() <{sym_name = "module"}> ({
    "gpu.func"() <{function_type = () -> (), kernel}> ({
      %0 = "nvvm.read.ptx.sreg.tid.x"() <{range = #llvm.constant_range<i32, 0, 32>}> : () -> i32
      %1 = "nvvm.read.ptx.sreg.tid.y"() <{range = #llvm.constant_range<i32, 0, 128>}> : () -> i32
      %2 = "nvvm.read.ptx.sreg.tid.z"() <{range = #llvm.constant_range<i32, 0, 4>}> : () -> i32
      %3 = "nvvm.read.ptx.sreg.cluster.ctaid.x"() : () -> i32
      %4 = "ub.poison"() <{value = #ub.poison}> : () -> i1
      %5 = "arith.constant"() <{value = 64 : i32}> : () -> i32
      %6 = "arith.cmpi"(%0, %5) <{predicate = 4 : i64}> : (i32, i32) -> i1
      "scf.if"(%6) ({
        "gpu.printf"() <{format = "threadidx"}> : () -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      %7 = "arith.cmpi"(%1, %5) <{predicate = 4 : i64}> : (i32, i32) -> i1
      "scf.if"(%7) ({
        "gpu.printf"() <{format = "threadidy"}> : () -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      %8 = "arith.cmpi"(%2, %5) <{predicate = 4 : i64}> : (i32, i32) -> i1
      "scf.if"(%8) ({
        "gpu.printf"() <{format = "threadidz"}> : () -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      %9 = "arith.select"(%4, %3, %5) : (i1, i32, i32) -> i32
      "gpu.printf"(%9) <{format = "ctaidx"}> : (i32) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "kernel_1"} : () -> ()
  }) : () -> ()
}) : () -> ()

