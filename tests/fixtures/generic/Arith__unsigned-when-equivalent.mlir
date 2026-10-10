"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (i32, i32, i32, i32, i32, i32, i64, i1, i1, i1, i1), sym_name = "not_with_maybe_overflow"}> ({
  ^bb0(%arg23: i32):
    %29 = "arith.constant"() <{value = 2147483647 : i32}> : () -> i32
    %30 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %31 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %32 = "arith.minui"(%arg23, %29) : (i32, i32) -> i32
    %33 = "arith.addi"(%32, %30) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %34 = "arith.divsi"(%33, %31) : (i32, i32) -> i32
    %35 = "arith.ceildivsi"(%33, %31) : (i32, i32) -> i32
    %36 = "arith.floordivsi"(%33, %31) : (i32, i32) -> i32
    %37 = "arith.remsi"(%33, %31) : (i32, i32) -> i32
    %38 = "arith.minsi"(%33, %31) : (i32, i32) -> i32
    %39 = "arith.maxsi"(%33, %31) : (i32, i32) -> i32
    %40 = "arith.extsi"(%33) : (i32) -> i64
    %41 = "arith.cmpi"(%33, %31) <{predicate = 3 : i64}> : (i32, i32) -> i1
    %42 = "arith.cmpi"(%33, %31) <{predicate = 2 : i64}> : (i32, i32) -> i1
    %43 = "arith.cmpi"(%33, %31) <{predicate = 5 : i64}> : (i32, i32) -> i1
    %44 = "arith.cmpi"(%33, %31) <{predicate = 4 : i64}> : (i32, i32) -> i1
    "func.return"(%34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44) : (i32, i32, i32, i32, i32, i32, i64, i1, i1, i1, i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (i32, i32, i32, i32, i32, i32, i64, i1, i1, i1, i1), sym_name = "yes_with_no_overflow"}> ({
  ^bb0(%arg22: i32):
    %13 = "arith.constant"() <{value = 2147483646 : i32}> : () -> i32
    %14 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %15 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %16 = "arith.minui"(%arg22, %13) : (i32, i32) -> i32
    %17 = "arith.addi"(%16, %14) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %18 = "arith.divsi"(%17, %15) : (i32, i32) -> i32
    %19 = "arith.ceildivsi"(%17, %15) : (i32, i32) -> i32
    %20 = "arith.floordivsi"(%17, %15) : (i32, i32) -> i32
    %21 = "arith.remsi"(%17, %15) : (i32, i32) -> i32
    %22 = "arith.minsi"(%17, %15) : (i32, i32) -> i32
    %23 = "arith.maxsi"(%17, %15) : (i32, i32) -> i32
    %24 = "arith.extsi"(%17) : (i32) -> i64
    %25 = "arith.cmpi"(%17, %15) <{predicate = 3 : i64}> : (i32, i32) -> i1
    %26 = "arith.cmpi"(%17, %15) <{predicate = 2 : i64}> : (i32, i32) -> i1
    %27 = "arith.cmpi"(%17, %15) <{predicate = 5 : i64}> : (i32, i32) -> i1
    %28 = "arith.cmpi"(%17, %15) <{predicate = 4 : i64}> : (i32, i32) -> i1
    "func.return"(%18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28) : (i32, i32, i32, i32, i32, i32, i64, i1, i1, i1, i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xindex>) -> (), sym_name = "preserves_structure"}> ({
  ^bb0(%arg20: memref<8xindex>):
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index
    %8 = "arith.constant"() <{value = 4 : index}> : () -> index
    %9 = "arith.constant"() <{value = 8 : index}> : () -> index
    "scf.for"(%6, %9, %7) ({
    ^bb0(%arg21: index):
      %10 = "arith.remsi"(%arg21, %8) : (index, index) -> index
      %11 = "arith.addi"(%10, %10) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %12 = "arith.cmpi"(%11, %8) <{predicate = 3 : i64}> : (index, index) -> i1
      "scf.if"(%12) ({
        "memref.store"(%11, %arg20, %arg21) : (index, memref<8xindex>, index) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "external", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> i8, sym_name = "dead_code"}> ({
    %4 = "func.call"() <{callee = @external}> : () -> i8
    %5 = "arith.floordivsi"(%4, %4) : (i8, i8) -> i8
    "func.return"(%5) : (i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1xi32>) -> vector<1xi1>, sym_name = "no_integer_or_index"}> ({
  ^bb0(%arg19: vector<1xi32>):
    %2 = "arith.constant"() <{value = dense<0> : vector<1xi32>}> : () -> vector<1xi32>
    %3 = "arith.cmpi"(%2, %arg19) <{predicate = 2 : i64}> : (vector<1xi32>, vector<1xi32>) -> vector<1xi1>
    "func.return"(%3) : (vector<1xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x32xf32>, memref<2x32xf32>, memref<32xf32>, f32, !gpu.async.token, index, index) -> memref<2x32xf32>, sym_name = "gpu_func"}> ({
  ^bb0(%arg0: memref<2x32xf32>, %arg1: memref<2x32xf32>, %arg2: memref<32xf32>, %arg3: f32, %arg4: !gpu.async.token, %arg5: index, %arg6: index):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "gpu.launch"(%arg4, %0, %0, %0, %0, %0, %0) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index, %arg14: index, %arg15: index, %arg16: index, %arg17: index, %arg18: index):
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (!gpu.async.token, index, index, index, index, index, index) -> !gpu.async.token
    "func.return"(%arg1) : (memref<2x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

