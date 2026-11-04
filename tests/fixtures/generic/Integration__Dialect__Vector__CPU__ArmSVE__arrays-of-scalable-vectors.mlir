#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x?xf32>) -> (), sym_name = "read_and_print_2d_vector"}> ({
  ^bb0(%arg9: memref<3x?xf32>):
    %24 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %25 = "arith.constant"() <{value = 0 : index}> : () -> index
    %26 = "arith.constant"() <{value = 1 : index}> : () -> index
    %27 = "arith.constant"() <{value = 2 : index}> : () -> index
    %28 = "memref.dim"(%arg9, %26) : (memref<3x?xf32>, index) -> index
    %29 = "vector.create_mask"(%27, %28) : (index, index) -> vector<3x[8]xi1>
    %30 = "vector.transfer_read"(%arg9, %25, %25, %24, %29) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<3x?xf32>, index, index, f32, vector<3x[8]xi1>) -> vector<3x[8]xf32>
    %31 = "vector.extract"(%30) <{static_position = array<i64: 0>}> : (vector<3x[8]xf32>) -> vector<[8]xf32>
    %32 = "vector.extract"(%30) <{static_position = array<i64: 1>}> : (vector<3x[8]xf32>) -> vector<[8]xf32>
    %33 = "vector.extract"(%30) <{static_position = array<i64: 2>}> : (vector<3x[8]xf32>) -> vector<[8]xf32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "read_and_print_2d_vector()\0A"}> : () -> ()
    "vector.print"(%31) <{punctuation = #vector.punctuation<newline>}> : (vector<[8]xf32>) -> ()
    "vector.print"(%32) <{punctuation = #vector.punctuation<newline>}> : (vector<[8]xf32>) -> ()
    "vector.print"(%33) <{punctuation = #vector.punctuation<newline>}> : (vector<[8]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x2x[4]xf32>) -> (), sym_name = "print_1x2xVSCALExf32"}> ({
  ^bb0(%arg8: vector<1x2x[4]xf32>):
    %22 = "vector.extract"(%arg8) <{static_position = array<i64: 0, 1>}> : (vector<1x2x[4]xf32>) -> vector<[4]xf32>
    %23 = "vector.extract"(%arg8) <{static_position = array<i64: 0, 1>}> : (vector<1x2x[4]xf32>) -> vector<[4]xf32>
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xf32>) -> ()
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x2x?xf32>, memref<1x2x?xf32>) -> (), sym_name = "add_arrays_of_scalable_vectors"}> ({
  ^bb0(%arg6: memref<1x2x?xf32>, %arg7: memref<1x2x?xf32>):
    %11 = "arith.constant"() <{value = 0 : index}> : () -> index
    %12 = "arith.constant"() <{value = 2 : index}> : () -> index
    %13 = "arith.constant"() <{value = 2 : index}> : () -> index
    %14 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %15 = "memref.dim"(%arg6, %12) : (memref<1x2x?xf32>, index) -> index
    %16 = "memref.dim"(%arg7, %12) : (memref<1x2x?xf32>, index) -> index
    %17 = "vector.create_mask"(%12, %13, %15) : (index, index, index) -> vector<1x2x[4]xi1>
    %18 = "vector.create_mask"(%12, %13, %16) : (index, index, index) -> vector<1x2x[4]xi1>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "\0AVector A\0A"}> : () -> ()
    %19 = "vector.transfer_read"(%arg6, %11, %11, %11, %14, %17) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 3, 1, 1>, permutation_map = #map1}> : (memref<1x2x?xf32>, index, index, index, f32, vector<1x2x[4]xi1>) -> vector<1x2x[4]xf32>
    "func.call"(%19) <{callee = @print_1x2xVSCALExf32}> : (vector<1x2x[4]xf32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "\0AVector B\0A"}> : () -> ()
    %20 = "vector.transfer_read"(%arg7, %11, %11, %11, %14, %18) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 3, 1, 1>, permutation_map = #map1}> : (memref<1x2x?xf32>, index, index, index, f32, vector<1x2x[4]xi1>) -> vector<1x2x[4]xf32>
    "func.call"(%20) <{callee = @print_1x2xVSCALExf32}> : (vector<1x2x[4]xf32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "\0ASum\0A"}> : () -> ()
    %21 = "arith.addf"(%19, %20) <{fastmath = #arith.fastmath<none>}> : (vector<1x2x[4]xf32>, vector<1x2x[4]xf32>) -> vector<1x2x[4]xf32>
    "func.call"(%21) <{callee = @print_1x2xVSCALExf32}> : (vector<1x2x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "vector.vscale"() : () -> index
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %6 = "arith.muli"(%0, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %7 = "memref.alloca"(%6) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<3x?xf32>
    "linalg.fill"(%3, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, memref<3x?xf32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "=> Print and read 2D arrays of scalable vectors:\0A"}> : () -> ()
    "func.call"(%7) <{callee = @read_and_print_2d_vector}> : (memref<3x?xf32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "\0A====================\0A"}> : () -> ()
    %8 = "arith.muli"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %9 = "memref.alloca"(%8) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<1x2x?xf32>
    %10 = "memref.alloca"(%8) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<1x2x?xf32>
    "linalg.fill"(%4, %9) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (f32, memref<1x2x?xf32>) -> ()
    "linalg.fill"(%5, %10) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg0: f32, %arg1: f32):
      "linalg.yield"(%arg0) : (f32) -> ()
    }) : (f32, memref<1x2x?xf32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "=> Reading and adding two 3D arrays of scalable vectors:\0A"}> : () -> ()
    "func.call"(%9, %10) <{callee = @add_arrays_of_scalable_vectors}> : (memref<1x2x?xf32>, memref<1x2x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

