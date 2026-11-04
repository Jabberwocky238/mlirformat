#map = affine_map<()[s0] -> (s0 floordiv 4)>
#map1 = affine_map<()[s0] -> (s0 mod 2)>
#map2 = affine_map<()[s0] -> (s0 + 8)>
#map3 = affine_map<()[s0] -> (s0 * 2)>
#map4 = affine_map<(d0, d1) -> (d1)>
#map5 = affine_map<(d0) -> (d0 + 8)>
#map6 = affine_map<()[s0] -> (s0 + 16)>
#map7 = affine_map<()[s0] -> (s0 + 24)>
"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (memref<16x16xf16>, memref<16x2xi16>, memref<8x32xf16>, memref<16x8xf16>) -> ()}> ({
    ^bb0(%arg10: memref<16x16xf16>, %arg11: memref<16x2xi16>, %arg12: memref<8x32xf16>, %arg13: memref<16x8xf16>):
      %29 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
      %30 = "arith.constant"() <{value = 4 : index}> : () -> index
      %31 = "arith.constant"() <{value = 8 : index}> : () -> index
      %32 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      %33 = "affine.apply"(%32) <{map = #map}> : (index) -> index
      %34 = "affine.apply"(%32) <{map = #map1}> : (index) -> index
      %35 = "affine.apply"(%33) <{map = #map2}> : (index) -> index
      %36 = "memref.load"(%arg11, %33, %34) : (memref<16x2xi16>, index, index) -> i16
      %37 = "memref.load"(%arg11, %35, %34) : (memref<16x2xi16>, index, index) -> i16
      %38 = "arith.extui"(%36) : (i16) -> i32
      %39 = "arith.extui"(%37) : (i16) -> i32
      %40 = "arith.constant"() <{value = dense<0> : vector<2xi16>}> : () -> vector<2xi16>
      %41 = "vector.insert"(%36, %40) <{static_position = array<i64: 0>}> : (i16, vector<2xi16>) -> vector<2xi16>
      %42 = "vector.insert"(%37, %41) <{static_position = array<i64: 1>}> : (i16, vector<2xi16>) -> vector<2xi16>
      %43:2 = "affine.delinearize_index"(%32, %31, %30) <{static_basis = array<i64: -9223372036854775808, -9223372036854775808>}> : (index, index, index) -> (index, index)
      %44 = "affine.apply"(%43#1) <{map = #map3}> : (index) -> index
      %45 = "vector.transfer_read"(%arg10, %43#0, %44, %29) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (memref<16x16xf16>, index, index, f16) -> vector<2xf16>
      %46 = "affine.apply"(%43#0) <{map = #map5}> : (index) -> index
      %47 = "vector.transfer_read"(%arg10, %46, %44, %29) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (memref<16x16xf16>, index, index, f16) -> vector<2xf16>
      %48 = "affine.apply"(%44) <{map = #map5}> : (index) -> index
      %49 = "vector.transfer_read"(%arg10, %43#0, %48, %29) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (memref<16x16xf16>, index, index, f16) -> vector<2xf16>
      %50 = "vector.transfer_read"(%arg10, %46, %48, %29) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (memref<16x16xf16>, index, index, f16) -> vector<2xf16>
      %51 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4x2xf16>}> : () -> vector<4x2xf16>
      %52 = "vector.insert"(%45, %51) <{static_position = array<i64: 0>}> : (vector<2xf16>, vector<4x2xf16>) -> vector<4x2xf16>
      %53 = "vector.insert"(%47, %52) <{static_position = array<i64: 1>}> : (vector<2xf16>, vector<4x2xf16>) -> vector<4x2xf16>
      %54 = "vector.insert"(%49, %53) <{static_position = array<i64: 2>}> : (vector<2xf16>, vector<4x2xf16>) -> vector<4x2xf16>
      %55 = "vector.insert"(%50, %54) <{static_position = array<i64: 3>}> : (vector<2xf16>, vector<4x2xf16>) -> vector<4x2xf16>
      %56 = "vector.transfer_read"(%arg12, %43#0, %44, %29) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (memref<8x32xf16>, index, index, f16) -> vector<2xf16>
      %57 = "vector.transfer_read"(%arg12, %43#0, %48, %29) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (memref<8x32xf16>, index, index, f16) -> vector<2xf16>
      %58 = "affine.apply"(%44) <{map = #map6}> : (index) -> index
      %59 = "vector.transfer_read"(%arg12, %43#0, %58, %29) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (memref<8x32xf16>, index, index, f16) -> vector<2xf16>
      %60 = "affine.apply"(%44) <{map = #map7}> : (index) -> index
      %61 = "vector.transfer_read"(%arg12, %43#0, %60, %29) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (memref<8x32xf16>, index, index, f16) -> vector<2xf16>
      %62 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4x2xf16>}> : () -> vector<4x2xf16>
      %63 = "vector.insert"(%56, %62) <{static_position = array<i64: 0>}> : (vector<2xf16>, vector<4x2xf16>) -> vector<4x2xf16>
      %64 = "vector.insert"(%57, %63) <{static_position = array<i64: 1>}> : (vector<2xf16>, vector<4x2xf16>) -> vector<4x2xf16>
      %65 = "vector.insert"(%59, %64) <{static_position = array<i64: 2>}> : (vector<2xf16>, vector<4x2xf16>) -> vector<4x2xf16>
      %66 = "vector.insert"(%61, %65) <{static_position = array<i64: 3>}> : (vector<2xf16>, vector<4x2xf16>) -> vector<4x2xf16>
      %67 = "arith.constant"() <{value = dense<0.000000e+00> : vector<2x2xf16>}> : () -> vector<2x2xf16>
      "gpu.barrier"() : () -> ()
      %68 = "nvgpu.mma.sp.sync"(%55, %66, %67, %42) <{mmaShape = [16, 8, 32], sparsitySelector = 0 : i32}> : (vector<4x2xf16>, vector<4x2xf16>, vector<2x2xf16>, vector<2xi16>) -> vector<2x2xf16>
      %69 = "vector.extract"(%68) <{static_position = array<i64: 0>}> : (vector<2x2xf16>) -> vector<2xf16>
      %70 = "vector.extract"(%68) <{static_position = array<i64: 1>}> : (vector<2x2xf16>) -> vector<2xf16>
      "vector.transfer_write"(%69, %arg13, %43#0, %44) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map4}> : (vector<2xf16>, memref<16x8xf16>, index, index) -> ()
      "vector.transfer_write"(%70, %arg13, %46, %44) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map4}> : (vector<2xf16>, memref<16x8xf16>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "mma_sp_sync_f16_16832", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index
    %4 = "arith.constant"() <{value = 8 : index}> : () -> index
    %5 = "arith.constant"() <{value = 16 : index}> : () -> index
    %6 = "arith.constant"() <{value = 32 : index}> : () -> index
    %7 = "arith.constant"() <{value = 64 : index}> : () -> index
    %8 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16>
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x32xf16>
    %10 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x8xf16>
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x2xi16>
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg8: index):
      "scf.for"(%1, %5, %2) ({
      ^bb0(%arg9: index):
        %25 = "arith.addi"(%arg8, %arg9) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %26 = "arith.addi"(%25, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %27 = "arith.index_cast"(%26) : (index) -> i32
        %28 = "arith.sitofp"(%27) : (i32) -> f16
        "memref.store"(%28, %8, %arg8, %arg9) : (f16, memref<16x16xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %12 = "arith.constant"() <{value = -30584 : i16}> : () -> i16
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg7: index):
      "memref.store"(%12, %11, %arg7, %1) : (i16, memref<16x2xi16>, index, index) -> ()
      "memref.store"(%12, %11, %arg7, %2) : (i16, memref<16x2xi16>, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%1, %4, %2) ({
    ^bb0(%arg5: index):
      "scf.for"(%1, %6, %2) ({
      ^bb0(%arg6: index):
        %22 = "arith.subi"(%arg5, %arg6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %23 = "arith.index_cast"(%22) : (index) -> i32
        %24 = "arith.sitofp"(%23) : (i32) -> f16
        "memref.store"(%24, %9, %arg5, %arg6) : (f16, memref<8x32xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg3: index):
      "scf.for"(%1, %4, %2) ({
      ^bb0(%arg4: index):
        "memref.store"(%0, %10, %arg3, %arg4) : (f16, memref<16x8xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg2: index):
      %21 = "vector.transfer_read"(%8, %arg2, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (memref<16x16xf16>, index, index, f16) -> vector<16xf16>
      "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf16>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%1, %4, %2) ({
    ^bb0(%arg1: index):
      %20 = "vector.transfer_read"(%9, %arg1, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (memref<8x32xf16>, index, index, f16) -> vector<32xf16>
      "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<32xf16>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %13 = "memref.cast"(%8) : (memref<16x16xf16>) -> memref<*xf16>
    "gpu.host_register"(%13) : (memref<*xf16>) -> ()
    %14 = "memref.cast"(%11) : (memref<16x2xi16>) -> memref<*xi16>
    "gpu.host_register"(%14) : (memref<*xi16>) -> ()
    %15 = "memref.cast"(%9) : (memref<8x32xf16>) -> memref<*xf16>
    "gpu.host_register"(%15) : (memref<*xf16>) -> ()
    %16 = "memref.cast"(%10) : (memref<16x8xf16>) -> memref<*xf16>
    "gpu.host_register"(%16) : (memref<*xf16>) -> ()
    %17 = "arith.constant"() <{value = 1 : index}> : () -> index
    %18 = "arith.constant"() <{value = 32 : index}> : () -> index
    "gpu.launch_func"(%17, %17, %17, %18, %17, %17, %8, %11, %9, %10) <{kernel = @kernels::@mma_sp_sync_f16_16832, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 4, 0>}> : (index, index, index, index, index, index, memref<16x16xf16>, memref<16x2xi16>, memref<8x32xf16>, memref<16x8xf16>) -> ()
    "gpu.host_unregister"(%13) : (memref<*xf16>) -> ()
    "gpu.host_unregister"(%14) : (memref<*xi16>) -> ()
    "gpu.host_unregister"(%15) : (memref<*xf16>) -> ()
    "gpu.host_unregister"(%16) : (memref<*xf16>) -> ()
    "scf.for"(%1, %5, %2) ({
    ^bb0(%arg0: index):
      %19 = "vector.transfer_read"(%10, %arg0, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (memref<16x8xf16>, index, index, f16) -> vector<8xf16>
      "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf16>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) {gpu.container_module} : () -> ()

