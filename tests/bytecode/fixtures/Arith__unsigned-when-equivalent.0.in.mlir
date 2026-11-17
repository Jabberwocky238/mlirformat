"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (i32, i32, i32, i32, i32, i32, i64, i1, i1, i1, i1), sym_name = "not_with_maybe_overflow"}> ({
  ^bb0(%arg23: i32 loc("<stdin>":3:8)):
    %29 = "arith.constant"() <{value = 2147483647 : i32}> : () -> i32 loc("<stdin>":4:11)
    %30 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":5:11)
    %31 = "arith.constant"() <{value = 4 : i32}> : () -> i32 loc("<stdin>":6:11)
    %32 = "arith.minui"(%arg23, %29) : (i32, i32) -> i32 loc("<stdin>":7:11)
    %33 = "arith.addi"(%32, %30) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":8:11)
    %34 = "arith.divsi"(%33, %31) : (i32, i32) -> i32 loc("<stdin>":9:11)
    %35 = "arith.ceildivsi"(%33, %31) : (i32, i32) -> i32 loc("<stdin>":10:11)
    %36 = "arith.floordivsi"(%33, %31) : (i32, i32) -> i32 loc("<stdin>":11:11)
    %37 = "arith.remsi"(%33, %31) : (i32, i32) -> i32 loc("<stdin>":12:11)
    %38 = "arith.minsi"(%33, %31) : (i32, i32) -> i32 loc("<stdin>":13:11)
    %39 = "arith.maxsi"(%33, %31) : (i32, i32) -> i32 loc("<stdin>":14:11)
    %40 = "arith.extsi"(%33) : (i32) -> i64 loc("<stdin>":15:11)
    %41 = "arith.cmpi"(%33, %31) <{predicate = 3 : i64}> : (i32, i32) -> i1 loc("<stdin>":16:11)
    %42 = "arith.cmpi"(%33, %31) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":17:11)
    %43 = "arith.cmpi"(%33, %31) <{predicate = 5 : i64}> : (i32, i32) -> i1 loc("<stdin>":18:11)
    %44 = "arith.cmpi"(%33, %31) <{predicate = 4 : i64}> : (i32, i32) -> i1 loc("<stdin>":19:11)
    "func.return"(%34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44) : (i32, i32, i32, i32, i32, i32, i64, i1, i1, i1, i1) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32) -> (i32, i32, i32, i32, i32, i32, i64, i1, i1, i1, i1), sym_name = "yes_with_no_overflow"}> ({
  ^bb0(%arg22: i32 loc("<stdin>":23:8)):
    %13 = "arith.constant"() <{value = 2147483646 : i32}> : () -> i32 loc("<stdin>":24:11)
    %14 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":25:11)
    %15 = "arith.constant"() <{value = 4 : i32}> : () -> i32 loc("<stdin>":26:11)
    %16 = "arith.minui"(%arg22, %13) : (i32, i32) -> i32 loc("<stdin>":27:11)
    %17 = "arith.addi"(%16, %14) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":28:11)
    %18 = "arith.divsi"(%17, %15) : (i32, i32) -> i32 loc("<stdin>":29:11)
    %19 = "arith.ceildivsi"(%17, %15) : (i32, i32) -> i32 loc("<stdin>":30:11)
    %20 = "arith.floordivsi"(%17, %15) : (i32, i32) -> i32 loc("<stdin>":31:11)
    %21 = "arith.remsi"(%17, %15) : (i32, i32) -> i32 loc("<stdin>":32:11)
    %22 = "arith.minsi"(%17, %15) : (i32, i32) -> i32 loc("<stdin>":33:11)
    %23 = "arith.maxsi"(%17, %15) : (i32, i32) -> i32 loc("<stdin>":34:11)
    %24 = "arith.extsi"(%17) : (i32) -> i64 loc("<stdin>":35:11)
    %25 = "arith.cmpi"(%17, %15) <{predicate = 3 : i64}> : (i32, i32) -> i1 loc("<stdin>":36:11)
    %26 = "arith.cmpi"(%17, %15) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":37:11)
    %27 = "arith.cmpi"(%17, %15) <{predicate = 5 : i64}> : (i32, i32) -> i1 loc("<stdin>":38:11)
    %28 = "arith.cmpi"(%17, %15) <{predicate = 4 : i64}> : (i32, i32) -> i1 loc("<stdin>":39:11)
    "func.return"(%18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28) : (i32, i32, i32, i32, i32, i32, i64, i1, i1, i1, i1) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (memref<8xindex>) -> (), sym_name = "preserves_structure"}> ({
  ^bb0(%arg20: memref<8xindex> loc("<stdin>":43:8)):
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":44:10)
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":45:10)
    %8 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":46:10)
    %9 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":47:10)
    "scf.for"(%6, %9, %7) ({
    ^bb0(%arg21: index loc("<stdin>":49:10)):
      %10 = "arith.remsi"(%arg21, %8) : (index, index) -> index loc("<stdin>":50:13)
      %11 = "arith.addi"(%10, %10) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":51:13)
      %12 = "arith.cmpi"(%11, %8) <{predicate = 3 : i64}> : (index, index) -> i1 loc("<stdin>":52:13)
      "scf.if"(%12) ({
        "memref.store"(%11, %arg20, %arg21) : (index, memref<8xindex>, index) -> () loc("<stdin>":54:9)
        "scf.yield"() : () -> () loc("<stdin>":55:9)
      }, {
      }) : (i1) -> () loc("<stdin>":53:7)
      "scf.yield"() : () -> () loc("<stdin>":58:7)
    }) : (index, index, index) -> () loc("<stdin>":48:5)
    "func.return"() : () -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = () -> i8, sym_name = "external", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":62:3)
  "func.func"() <{function_type = () -> i8, sym_name = "dead_code"}> ({
    %4 = "func.call"() <{callee = @external}> : () -> i8 loc("<stdin>":65:10)
    %5 = "arith.floordivsi"(%4, %4) : (i8, i8) -> i8 loc("<stdin>":66:10)
    "func.return"(%5) : (i8) -> () loc("<stdin>":67:5)
  }) : () -> () loc("<stdin>":64:3)
  "func.func"() <{function_type = (vector<1xi32>) -> vector<1xi1>, sym_name = "no_integer_or_index"}> ({
  ^bb0(%arg19: vector<1xi32> loc("<stdin>":70:8)):
    %2 = "arith.constant"() <{value = dense<0> : vector<1xi32>}> : () -> vector<1xi32> loc("<stdin>":71:10)
    %3 = "arith.cmpi"(%2, %arg19) <{predicate = 2 : i64}> : (vector<1xi32>, vector<1xi32>) -> vector<1xi1> loc("<stdin>":72:10)
    "func.return"(%3) : (vector<1xi1>) -> () loc("<stdin>":73:5)
  }) : () -> () loc("<stdin>":69:3)
  "func.func"() <{function_type = (memref<2x32xf32>, memref<2x32xf32>, memref<32xf32>, f32, !gpu.async.token, index, index) -> memref<2x32xf32>, sym_name = "gpu_func"}> ({
  ^bb0(%arg0: memref<2x32xf32> loc("<stdin>":76:8), %arg1: memref<2x32xf32> loc("<stdin>":76:33), %arg2: memref<32xf32> loc("<stdin>":76:58), %arg3: f32 loc("<stdin>":76:81), %arg4: !gpu.async.token loc("<stdin>":76:93), %arg5: index loc("<stdin>":76:118), %arg6: index loc("<stdin>":76:132)):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":77:10)
    %1 = "gpu.launch"(%arg4, %0, %0, %0, %0, %0, %0) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg7: index loc("<stdin>":79:10), %arg8: index loc("<stdin>":79:24), %arg9: index loc("<stdin>":79:38), %arg10: index loc("<stdin>":79:52), %arg11: index loc("<stdin>":79:67), %arg12: index loc("<stdin>":79:82), %arg13: index loc("<stdin>":79:97), %arg14: index loc("<stdin>":79:112), %arg15: index loc("<stdin>":79:127), %arg16: index loc("<stdin>":79:142), %arg17: index loc("<stdin>":79:157), %arg18: index loc("<stdin>":79:172)):
      "gpu.terminator"() : () -> () loc("<stdin>":80:7)
    }) : (!gpu.async.token, index, index, index, index, index, index) -> !gpu.async.token loc("<stdin>":78:10)
    "func.return"(%arg1) : (memref<2x32xf32>) -> () loc("<stdin>":82:5)
  }) : () -> () loc("<stdin>":75:3)
}) : () -> () loc("<stdin>":1:1)
