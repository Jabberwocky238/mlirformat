#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d"}> ({
  ^bb0(%arg21: memref<?x?xf32>, %arg22: index, %arg23: index):
    %39 = "arith.constant"() <{value = 4 : index}> : () -> index
    %40 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %41 = "vector.transfer_read"(%arg21, %arg22, %arg23, %40) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<[4]x[4]xf32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN:\0A"}> : () -> ()
    "vector.print"(%41) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_transposed"}> ({
  ^bb0(%arg18: memref<?x?xf32>, %arg19: index, %arg20: index):
    %37 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %38 = "vector.transfer_read"(%arg18, %arg19, %arg20, %37) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (memref<?x?xf32>, index, index, f32) -> vector<[4]x[4]xf32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN:\0A"}> : () -> ()
    "vector.print"(%38) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_mask"}> ({
  ^bb0(%arg15: memref<?x?xf32>, %arg16: index, %arg17: index):
    %32 = "arith.constant"() <{value = 2 : index}> : () -> index
    %33 = "arith.constant"() <{value = 3 : index}> : () -> index
    %34 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %35 = "vector.create_mask"(%32, %33) : (index, index) -> vector<[4]x[4]xi1>
    %36 = "vector.transfer_read"(%arg15, %arg16, %arg17, %34, %35) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32, vector<[4]x[4]xi1>) -> vector<[4]x[4]xf32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN:\0A"}> : () -> ()
    "vector.print"(%36) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_mask_transposed"}> ({
  ^bb0(%arg12: memref<?x?xf32>, %arg13: index, %arg14: index):
    %27 = "arith.constant"() <{value = 2 : index}> : () -> index
    %28 = "arith.constant"() <{value = 3 : index}> : () -> index
    %29 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %30 = "vector.create_mask"(%27, %28) : (index, index) -> vector<[4]x[4]xi1>
    %31 = "vector.transfer_read"(%arg12, %arg13, %arg14, %29, %30) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map1}> : (memref<?x?xf32>, index, index, f32, vector<[4]x[4]xi1>) -> vector<[4]x[4]xf32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN:\0A"}> : () -> ()
    "vector.print"(%31) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_mask_non_zero_pad"}> ({
  ^bb0(%arg9: memref<?x?xf32>, %arg10: index, %arg11: index):
    %22 = "arith.constant"() <{value = 2 : index}> : () -> index
    %23 = "arith.constant"() <{value = 3 : index}> : () -> index
    %24 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %25 = "vector.create_mask"(%22, %23) : (index, index) -> vector<[4]x[4]xi1>
    %26 = "vector.transfer_read"(%arg9, %arg10, %arg11, %24, %25) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32, vector<[4]x[4]xi1>) -> vector<[4]x[4]xf32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN:\0A"}> : () -> ()
    "vector.print"(%26) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_mask_non_zero_pad_transposed"}> ({
  ^bb0(%arg6: memref<?x?xf32>, %arg7: index, %arg8: index):
    %17 = "arith.constant"() <{value = 2 : index}> : () -> index
    %18 = "arith.constant"() <{value = 3 : index}> : () -> index
    %19 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %20 = "vector.create_mask"(%17, %18) : (index, index) -> vector<[4]x[4]xi1>
    %21 = "vector.transfer_read"(%arg6, %arg7, %arg8, %19, %20) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map1}> : (memref<?x?xf32>, index, index, f32, vector<[4]x[4]xi1>) -> vector<[4]x[4]xf32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN:\0A"}> : () -> ()
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> memref<?x?xf32>, sym_name = "initialize_memory"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index
    %9 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %10 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32
    %11 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %12 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %13 = "scf.for"(%7, %arg0, %8, %12) ({
    ^bb0(%arg2: index, %arg3: f32):
      %14 = "scf.for"(%7, %arg1, %8, %arg3) ({
      ^bb0(%arg4: index, %arg5: f32):
        "memref.store"(%arg5, %11, %arg2, %arg4) : (f32, memref<?x?xf32>, index, index) -> ()
        %16 = "arith.addf"(%arg5, %9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.yield"(%16) : (f32) -> ()
      }) : (index, index, index, f32) -> f32
      %15 = "arith.addf"(%arg3, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"(%15) : (f32) -> ()
    }) : (index, index, index, f32) -> f32
    "func.return"(%11) : (memref<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    %4 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<word>}> : () -> index
    %5 = "arith.addi"(%4, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %6 = "func.call"(%5, %5) <{callee = @initialize_memory}> : (index, index) -> memref<?x?xf32>
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %1, %2) <{callee = @transfer_read_2d}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d_mask}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d_mask_non_zero_pad}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d_transposed}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d_mask_transposed}> : (memref<?x?xf32>, index, index) -> ()
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d_mask_non_zero_pad_transposed}> : (memref<?x?xf32>, index, index) -> ()
    "memref.dealloc"(%6) : (memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

