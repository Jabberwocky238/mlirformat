#map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d1, 0, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, 0, 0)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d3, d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, index, index, index, index) -> (), sym_name = "transfer_read_3d"}> ({
  ^bb0(%arg29: memref<?x?x?x?xf32>, %arg30: index, %arg31: index, %arg32: index, %arg33: index):
    %33 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %34 = "vector.transfer_read"(%arg29, %arg30, %arg31, %arg32, %arg33, %33) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x?x?xf32>, index, index, index, index, f32) -> vector<2x5x3xf32>
    "vector.print"(%34) <{punctuation = #vector.punctuation<newline>}> : (vector<2x5x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, index, index, index, index) -> (), sym_name = "transfer_read_3d_and_extract"}> ({
  ^bb0(%arg24: memref<?x?x?x?xf32>, %arg25: index, %arg26: index, %arg27: index, %arg28: index):
    %30 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %31 = "vector.transfer_read"(%arg24, %arg25, %arg26, %arg27, %arg28, %30) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x?x?xf32>, index, index, index, index, f32) -> vector<2x5x3xf32>
    %32 = "vector.extract"(%31) <{static_position = array<i64: 0>}> : (vector<2x5x3xf32>) -> vector<5x3xf32>
    "vector.print"(%32) <{punctuation = #vector.punctuation<newline>}> : (vector<5x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, index, index, index, index) -> (), sym_name = "transfer_read_3d_broadcast"}> ({
  ^bb0(%arg19: memref<?x?x?x?xf32>, %arg20: index, %arg21: index, %arg22: index, %arg23: index):
    %28 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %29 = "vector.transfer_read"(%arg19, %arg20, %arg21, %arg22, %arg23, %28) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map1}> : (memref<?x?x?x?xf32>, index, index, index, index, f32) -> vector<2x5x3xf32>
    "vector.print"(%29) <{punctuation = #vector.punctuation<newline>}> : (vector<2x5x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, index, index, index, index) -> (), sym_name = "transfer_read_3d_mask_broadcast"}> ({
  ^bb0(%arg14: memref<?x?x?x?xf32>, %arg15: index, %arg16: index, %arg17: index, %arg18: index):
    %25 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %26 = "arith.constant"() <{value = dense<[false, true]> : vector<2xi1>}> : () -> vector<2xi1>
    %27 = "vector.transfer_read"(%arg14, %arg15, %arg16, %arg17, %arg18, %25, %26) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 1>, permutation_map = #map2}> : (memref<?x?x?x?xf32>, index, index, index, index, f32, vector<2xi1>) -> vector<2x5x3xf32>
    "vector.print"(%27) <{punctuation = #vector.punctuation<newline>}> : (vector<2x5x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, index, index, index, index) -> (), sym_name = "transfer_read_3d_transposed"}> ({
  ^bb0(%arg9: memref<?x?x?x?xf32>, %arg10: index, %arg11: index, %arg12: index, %arg13: index):
    %23 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %24 = "vector.transfer_read"(%arg9, %arg10, %arg11, %arg12, %arg13, %23) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map3}> : (memref<?x?x?x?xf32>, index, index, index, index, f32) -> vector<3x5x3xf32>
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (vector<3x5x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, index, index, index, index) -> (), sym_name = "transfer_write_3d"}> ({
  ^bb0(%arg4: memref<?x?x?x?xf32>, %arg5: index, %arg6: index, %arg7: index, %arg8: index):
    %21 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    %22 = "vector.broadcast"(%21) : (f32) -> vector<2x9x3xf32>
    "vector.transfer_write"(%22, %arg4, %arg5, %arg6, %arg7, %arg8) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<2x9x3xf32>, memref<?x?x?x?xf32>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32
    %6 = "arith.constant"() <{value = 5 : index}> : () -> index
    %7 = "arith.constant"() <{value = 4 : index}> : () -> index
    %8 = "arith.constant"() <{value = 2 : index}> : () -> index
    %9 = "arith.constant"() <{value = 10 : index}> : () -> index
    %10 = "memref.alloc"(%9, %6, %7, %8) <{operandSegmentSizes = array<i32: 4, 0>}> : (index, index, index, index) -> memref<?x?x?x?xf32>
    "scf.for"(%0, %9, %1) ({
    ^bb0(%arg0: index):
      "scf.for"(%0, %6, %1) ({
      ^bb0(%arg1: index):
        %11 = "arith.index_cast"(%arg1) : (index) -> i32
        %12 = "arith.sitofp"(%11) : (i32) -> f32
        %13 = "arith.mulf"(%12, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.for"(%0, %7, %1) ({
        ^bb0(%arg2: index):
          %14 = "arith.index_cast"(%arg2) : (index) -> i32
          %15 = "arith.sitofp"(%14) : (i32) -> f32
          %16 = "arith.addf"(%13, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "scf.for"(%0, %8, %1) ({
          ^bb0(%arg3: index):
            %17 = "arith.index_cast"(%arg3) : (index) -> i32
            %18 = "arith.sitofp"(%17) : (i32) -> f32
            %19 = "arith.addf"(%4, %18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            %20 = "arith.mulf"(%16, %19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
            "memref.store"(%20, %10, %arg0, %arg1, %arg2, %arg3) : (f32, memref<?x?x?x?xf32>, index, index, index, index) -> ()
            "scf.yield"() : () -> ()
          }) : (index, index, index) -> ()
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.call"(%10, %0, %0, %0, %0) <{callee = @transfer_read_3d}> : (memref<?x?x?x?xf32>, index, index, index, index) -> ()
    "func.call"(%10, %0, %0, %0, %0) <{callee = @transfer_read_3d_and_extract}> : (memref<?x?x?x?xf32>, index, index, index, index) -> ()
    "func.call"(%10, %0, %0, %1, %1) <{callee = @transfer_write_3d}> : (memref<?x?x?x?xf32>, index, index, index, index) -> ()
    "func.call"(%10, %0, %0, %0, %0) <{callee = @transfer_read_3d}> : (memref<?x?x?x?xf32>, index, index, index, index) -> ()
    "func.call"(%10, %0, %0, %0, %0) <{callee = @transfer_read_3d_transposed}> : (memref<?x?x?x?xf32>, index, index, index, index) -> ()
    "func.call"(%10, %0, %0, %0, %0) <{callee = @transfer_read_3d_broadcast}> : (memref<?x?x?x?xf32>, index, index, index, index) -> ()
    "func.call"(%10, %0, %0, %0, %0) <{callee = @transfer_read_3d_mask_broadcast}> : (memref<?x?x?x?xf32>, index, index, index, index) -> ()
    "memref.dealloc"(%10) : (memref<?x?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

