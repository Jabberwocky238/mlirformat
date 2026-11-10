#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> f16, sym_name = "compute_linspace_val"}> ({
  ^bb0(%arg31: index, %arg32: index, %arg33: index):
    %44 = "arith.index_cast"(%arg31) : (index) -> i32
    %45 = "arith.index_cast"(%arg32) : (index) -> i32
    %46 = "arith.index_cast"(%arg33) : (index) -> i32
    %47 = "arith.muli"(%44, %46) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %48 = "arith.addi"(%45, %47) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %49 = "arith.sitofp"(%48) : (i32) -> f16
    %50 = "arith.constant"() <{value = 6.400000e+01 : f16}> : () -> f16
    %51 = "arith.divf"(%49, %50) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
    "func.return"(%51) : (f16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16x16xf16>) -> (), sym_name = "print_lhs_as_memref_32"}> ({
  ^bb0(%arg28: memref<16x16xf16>):
    %36 = "arith.constant"() <{value = 0 : index}> : () -> index
    %37 = "arith.constant"() <{value = 1 : index}> : () -> index
    %38 = "memref.dim"(%arg28, %36) : (memref<16x16xf16>, index) -> index
    %39 = "memref.dim"(%arg28, %37) : (memref<16x16xf16>, index) -> index
    %40 = "memref.alloc"(%38, %39) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    "scf.for"(%36, %38, %37) ({
    ^bb0(%arg29: index):
      "scf.for"(%36, %39, %37) ({
      ^bb0(%arg30: index):
        %42 = "memref.load"(%arg28, %arg29, %arg30) : (memref<16x16xf16>, index, index) -> f16
        %43 = "arith.extf"(%42) : (f16) -> f32
        "memref.store"(%43, %40, %arg29, %arg30) : (f32, memref<?x?xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %41 = "memref.cast"(%40) : (memref<?x?xf32>) -> memref<*xf32>
    "func.call"(%41) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%40) : (memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16x8xf16>) -> (), sym_name = "print_rhs_as_memref_32"}> ({
  ^bb0(%arg25: memref<16x8xf16>):
    %28 = "arith.constant"() <{value = 0 : index}> : () -> index
    %29 = "arith.constant"() <{value = 1 : index}> : () -> index
    %30 = "memref.dim"(%arg25, %28) : (memref<16x8xf16>, index) -> index
    %31 = "memref.dim"(%arg25, %29) : (memref<16x8xf16>, index) -> index
    %32 = "memref.alloc"(%30, %31) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    "scf.for"(%28, %30, %29) ({
    ^bb0(%arg26: index):
      "scf.for"(%28, %31, %29) ({
      ^bb0(%arg27: index):
        %34 = "memref.load"(%arg25, %arg26, %arg27) : (memref<16x8xf16>, index, index) -> f16
        %35 = "arith.extf"(%34) : (f16) -> f32
        "memref.store"(%35, %32, %arg26, %arg27) : (f32, memref<?x?xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %33 = "memref.cast"(%32) : (memref<?x?xf32>) -> memref<*xf32>
    "func.call"(%33) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%32) : (memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16x8xf16>) -> (), sym_name = "print_res_as_memref_32"}> ({
  ^bb0(%arg22: memref<16x8xf16>):
    %20 = "arith.constant"() <{value = 0 : index}> : () -> index
    %21 = "arith.constant"() <{value = 1 : index}> : () -> index
    %22 = "memref.dim"(%arg22, %20) : (memref<16x8xf16>, index) -> index
    %23 = "memref.dim"(%arg22, %21) : (memref<16x8xf16>, index) -> index
    %24 = "memref.alloc"(%22, %23) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    "scf.for"(%20, %22, %21) ({
    ^bb0(%arg23: index):
      "scf.for"(%20, %23, %21) ({
      ^bb0(%arg24: index):
        %26 = "memref.load"(%arg22, %arg23, %arg24) : (memref<16x8xf16>, index, index) -> f16
        %27 = "arith.extf"(%26) : (f16) -> f32
        "memref.store"(%27, %24, %arg23, %arg24) : (f32, memref<?x?xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %25 = "memref.cast"(%24) : (memref<?x?xf32>) -> memref<*xf32>
    "func.call"(%25) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%24) : (memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x8xf16>
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x8xf16>
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    %6 = "memref.dim"(%3, %4) : (memref<16x8xf16>, index) -> index
    %7 = "memref.dim"(%3, %5) : (memref<16x8xf16>, index) -> index
    %8 = "memref.dim"(%1, %5) : (memref<16x16xf16>, index) -> index
    %9 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16
    %10 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %11 = "arith.constant"() <{value = 32 : index}> : () -> index
    "scf.for"(%4, %6, %5) ({
    ^bb0(%arg20: index):
      "scf.for"(%4, %8, %5) ({
      ^bb0(%arg21: index):
        %19 = "func.call"(%arg20, %arg21, %8) <{callee = @compute_linspace_val}> : (index, index, index) -> f16
        "memref.store"(%19, %1, %arg20, %arg21) : (f16, memref<16x16xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%4, %8, %5) ({
    ^bb0(%arg18: index):
      "scf.for"(%4, %7, %5) ({
      ^bb0(%arg19: index):
        %18 = "func.call"(%arg18, %arg19, %7) <{callee = @compute_linspace_val}> : (index, index, index) -> f16
        "memref.store"(%18, %2, %arg18, %arg19) : (f16, memref<16x8xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%4, %6, %5) ({
    ^bb0(%arg16: index):
      "scf.for"(%4, %7, %5) ({
      ^bb0(%arg17: index):
        %17 = "func.call"(%arg16, %arg17, %7) <{callee = @compute_linspace_val}> : (index, index, index) -> f16
        "memref.store"(%17, %3, %arg16, %arg17) : (f16, memref<16x8xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %12 = "memref.cast"(%1) : (memref<16x16xf16>) -> memref<*xf16>
    %13 = "memref.cast"(%2) : (memref<16x8xf16>) -> memref<*xf16>
    %14 = "memref.cast"(%3) : (memref<16x8xf16>) -> memref<*xf16>
    "gpu.host_register"(%12) : (memref<*xf16>) -> ()
    "gpu.host_register"(%13) : (memref<*xf16>) -> ()
    "gpu.host_register"(%14) : (memref<*xf16>) -> ()
    "func.call"(%1) <{callee = @print_lhs_as_memref_32}> : (memref<16x16xf16>) -> ()
    "func.call"(%2) <{callee = @print_rhs_as_memref_32}> : (memref<16x8xf16>) -> ()
    "func.call"(%3) <{callee = @print_res_as_memref_32}> : (memref<16x8xf16>) -> ()
    "gpu.launch"(%5, %5, %5, %11, %5, %5) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index):
      "linalg.matmul"(%1, %2, %3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg13: f16, %arg14: f16, %arg15: f16):
        %15 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
        %16 = "arith.addf"(%arg15, %15) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
        "linalg.yield"(%16) : (f16) -> ()
      }) : (memref<16x16xf16>, memref<16x8xf16>, memref<16x8xf16>) -> ()
      "gpu.terminator"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.call"(%3) <{callee = @print_res_as_memref_32}> : (memref<16x8xf16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      "transform.nvgpu.rewrite_matmul_as_mma_sync"(%0) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

