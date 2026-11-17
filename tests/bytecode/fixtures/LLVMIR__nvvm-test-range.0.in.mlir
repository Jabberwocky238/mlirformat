"builtin.module"() ({
  "gpu.module"() <{sym_name = "module"}> ({
    "gpu.func"() <{function_type = () -> (), kernel}> ({
      %0 = "nvvm.read.ptx.sreg.tid.x"() <{range = #llvm.constant_range<i32, 0, 32>}> : () -> i32 loc("<stdin>":4:12)
      %1 = "nvvm.read.ptx.sreg.tid.y"() <{range = #llvm.constant_range<i32, 0, 128>}> : () -> i32 loc("<stdin>":5:12)
      %2 = "nvvm.read.ptx.sreg.tid.z"() <{range = #llvm.constant_range<i32, 0, 4>}> : () -> i32 loc("<stdin>":6:12)
      %3 = "nvvm.read.ptx.sreg.cluster.ctaid.x"() : () -> i32 loc("<stdin>":7:12)
      %4 = "ub.poison"() <{value = #ub.poison}> : () -> i1 loc("<stdin>":8:12)
      %5 = "arith.constant"() <{value = 64 : i32}> : () -> i32 loc("<stdin>":9:12)
      %6 = "arith.cmpi"(%0, %5) <{predicate = 4 : i64}> : (i32, i32) -> i1 loc("<stdin>":10:12)
      "scf.if"(%6) ({
        "gpu.printf"() <{format = "threadidx"}> : () -> () loc("<stdin>":12:9)
        "scf.yield"() : () -> () loc("<stdin>":13:9)
      }, {
      }) : (i1) -> () loc("<stdin>":11:7)
      %7 = "arith.cmpi"(%1, %5) <{predicate = 4 : i64}> : (i32, i32) -> i1 loc("<stdin>":16:12)
      "scf.if"(%7) ({
        "gpu.printf"() <{format = "threadidy"}> : () -> () loc("<stdin>":18:9)
        "scf.yield"() : () -> () loc("<stdin>":19:9)
      }, {
      }) : (i1) -> () loc("<stdin>":17:7)
      %8 = "arith.cmpi"(%2, %5) <{predicate = 4 : i64}> : (i32, i32) -> i1 loc("<stdin>":22:12)
      "scf.if"(%8) ({
        "gpu.printf"() <{format = "threadidz"}> : () -> () loc("<stdin>":24:9)
        "scf.yield"() : () -> () loc("<stdin>":25:9)
      }, {
      }) : (i1) -> () loc("<stdin>":23:7)
      %9 = "arith.select"(%4, %3, %5) : (i1, i32, i32) -> i32 loc("<stdin>":28:12)
      "gpu.printf"(%9) <{format = "ctaidx"}> : (i32) -> () loc("<stdin>":29:7)
      "gpu.return"() : () -> () loc("<stdin>":30:7)
    }) {sym_name = "kernel_1"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
