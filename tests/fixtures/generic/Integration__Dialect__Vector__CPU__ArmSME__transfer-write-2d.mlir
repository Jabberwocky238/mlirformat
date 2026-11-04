#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_write_2d"}> ({
  ^bb0(%arg18: memref<?x?xf32>, %arg19: index, %arg20: index):
    %27 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %28 = "vector.broadcast"(%27) : (f32) -> vector<[4]x[4]xf32>
    "vector.transfer_write"(%28, %arg18, %arg19, %arg20) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[4]x[4]xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_write_2d_mask"}> ({
  ^bb0(%arg15: memref<?x?xf32>, %arg16: index, %arg17: index):
    %22 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %23 = "arith.constant"() <{value = 2 : index}> : () -> index
    %24 = "arith.constant"() <{value = 3 : index}> : () -> index
    %25 = "vector.create_mask"(%23, %24) : (index, index) -> vector<[4]x[4]xi1>
    %26 = "vector.broadcast"(%22) : (f32) -> vector<[4]x[4]xf32>
    "vector.transfer_write"(%26, %arg15, %arg16, %arg17, %25) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[4]x[4]xf32>, memref<?x?xf32>, index, index, vector<[4]x[4]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_write_2d_transposed"}> ({
  ^bb0(%arg12: memref<?x?xf32>, %arg13: index, %arg14: index):
    %21 = "vector.load"(%arg12, %arg13, %arg14) : (memref<?x?xf32>, index, index) -> vector<[4]x[4]xf32>
    "vector.transfer_write"(%21, %arg12, %arg13, %arg14) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map1}> : (vector<[4]x[4]xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_write_2d_mask_transposed"}> ({
  ^bb0(%arg9: memref<?x?xf32>, %arg10: index, %arg11: index):
    %17 = "arith.constant"() <{value = 2 : index}> : () -> index
    %18 = "arith.constant"() <{value = 4 : index}> : () -> index
    %19 = "vector.create_mask"(%18, %17) : (index, index) -> vector<[4]x[4]xi1>
    %20 = "vector.load"(%arg9, %arg10, %arg11) : (memref<?x?xf32>, index, index) -> vector<[4]x[4]xf32>
    "vector.transfer_write"(%20, %arg9, %arg10, %arg11, %19) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map1}> : (vector<[4]x[4]xf32>, memref<?x?xf32>, index, index, vector<[4]x[4]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "load_and_print"}> ({
  ^bb0(%arg6: memref<?x?xf32>, %arg7: index, %arg8: index):
    %16 = "vector.load"(%arg6, %arg7, %arg8) : (memref<?x?xf32>, index, index) -> vector<[4]x[4]xf32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN:\0A"}> : () -> ()
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> memref<?x?xf32>, sym_name = "initialize_memory"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index
    %8 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %9 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32
    %10 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %11 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %12 = "scf.for"(%6, %arg0, %7, %11) ({
    ^bb0(%arg2: index, %arg3: f32):
      %13 = "scf.for"(%6, %arg1, %7, %arg3) ({
      ^bb0(%arg4: index, %arg5: f32):
        "memref.store"(%arg5, %10, %arg2, %arg4) : (f32, memref<?x?xf32>, index, index) -> ()
        %15 = "arith.addf"(%arg5, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.yield"(%15) : (f32) -> ()
      }) : (index, index, index, f32) -> f32
      %14 = "arith.addf"(%arg3, %9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"(%14) : (f32) -> ()
    }) : (index, index, index, f32) -> f32
    "func.return"(%10) : (memref<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<word>}> : () -> index
    %4 = "arith.addi"(%3, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %5 = "func.call"(%4, %4) <{callee = @initialize_memory}> : (index, index) -> memref<?x?xf32>
    "func.call"(%5, %0, %0) <{callee = @load_and_print}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%5, %1, %1) <{callee = @transfer_write_2d}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%5, %0, %0) <{callee = @load_and_print}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%5, %0, %0) <{callee = @transfer_write_2d_mask}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%5, %0, %0) <{callee = @load_and_print}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%5, %0, %0) <{callee = @transfer_write_2d_transposed}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%5, %0, %0) <{callee = @load_and_print}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%5, %0, %0) <{callee = @transfer_write_2d_mask_transposed}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%5, %0, %0) <{callee = @load_and_print}> : (memref<?x?xf32>, index, index) -> ()
    "memref.dealloc"(%5) : (memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

