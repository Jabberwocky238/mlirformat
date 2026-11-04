"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?x?x8xi8>) -> vector<[4]x8xi8>, sym_name = "base_case"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 123 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg2, %arg0, %arg1, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x?x8xi8>, index, index, index, index, i8) -> vector<[4]x8xi8>
    "func.return"(%2) : (vector<[4]x8xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?x2x8xi8>) -> vector<[4]x2x8xi8>, sym_name = "with_3d_vector"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?x2x8xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 123 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg2, %arg0, %arg1, %0, %0, %1) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x2x8xi8>, index, index, index, index, i8) -> vector<[4]x2x8xi8>
    "func.return"(%2) : (vector<[4]x2x8xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?x?x8xi8>) -> vector<8x8xi8>, sym_name = "negative_vector_legal_fixed"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 123 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg2, %arg0, %arg1, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x?x8xi8>, index, index, index, index, i8) -> vector<8x8xi8>
    "func.return"(%2) : (vector<8x8xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?x?x8xi8>) -> vector<[8]xi8>, sym_name = "negative_vector_legal_1d_scalable"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 123 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg2, %arg0, %arg1, %0, %0, %1) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x?x8xi8>, index, index, index, index, i8) -> vector<[8]xi8>
    "func.return"(%2) : (vector<[8]xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?x?x8xi8>) -> vector<8x[8]xi8>, sym_name = "negative_vector_legal_trailing_scalable_dim"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 123 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg2, %arg0, %arg1, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x?x8xi8>, index, index, index, index, i8) -> vector<8x[8]xi8>
    "func.return"(%2) : (vector<8x[8]xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?x?x8xi8>) -> vector<[8]x[8]x8xi8>, sym_name = "negative_vector_type_two_scalable_dims"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 123 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg2, %arg0, %arg1, %0, %0, %1) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x?x8xi8>, index, index, index, index, i8) -> vector<[8]x[8]x8xi8>
    "func.return"(%2) : (vector<[8]x[8]x8xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, tensor<?x?x?x8xi8>) -> vector<[4]x8xi8>, sym_name = "negative_tensor_transfer"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: tensor<?x?x?x8xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 123 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg2, %arg0, %arg1, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (tensor<?x?x?x8xi8>, index, index, index, index, i8) -> vector<[4]x8xi8>
    "func.return"(%2) : (vector<[4]x8xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?x?x8xi8, strided<[?, ?, 16, 1]>>) -> vector<[4]x8xi8>, sym_name = "negative_discontig_mem"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8, strided<[?, ?, 16, 1]>>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 123 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg2, %arg0, %arg1, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x?x8xi8, strided<[?, ?, 16, 1]>>, index, index, index, index, i8) -> vector<[4]x8xi8>
    "func.return"(%2) : (vector<[4]x8xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, 0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?x?x8xi8>) -> vector<[4]x8xi8>, sym_name = "negative_broadcast"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 123 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg2, %arg0, %arg1, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x?x8xi8>, index, index, index, index, i8) -> vector<[4]x8xi8>
    "func.return"(%2) : (vector<[4]x8xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?x?x8xi8>, vector<[4]x8xi1>) -> vector<[4]x8xi8>, sym_name = "negative_masked"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8>, %arg3: vector<[4]x8xi1>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 123 : i8}> : () -> i8
    %2 = "vector.mask"(%arg3) ({
      %3 = "vector.transfer_read"(%arg2, %arg0, %arg1, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x?x8xi8>, index, index, index, index, i8) -> vector<[4]x8xi8>
      "vector.yield"(%3) : (vector<[4]x8xi8>) -> ()
    }) : (vector<[4]x8xi1>) -> vector<[4]x8xi8>
    "func.return"(%2) : (vector<[4]x8xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?x?x8xi8>, vector<[4]x8xi1>) -> vector<[4]x8xi8>, sym_name = "negative_with_mask"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8>, %arg3: vector<[4]x8xi1>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 123 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg2, %arg0, %arg1, %0, %0, %1, %arg3) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 1>, permutation_map = #map}> : (memref<?x?x?x8xi8>, index, index, index, index, i8, vector<[4]x8xi1>) -> vector<[4]x8xi8>
    "func.return"(%2) : (vector<[4]x8xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?x?x8xi8>) -> vector<[4]x4xi8>, sym_name = "negative_non_matching_dim_static"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?x?x8xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 123 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg2, %arg0, %arg1, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x?x8xi8>, index, index, index, index, i8) -> vector<[4]x4xi8>
    "func.return"(%2) : (vector<[4]x4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?x?x?xi8>) -> vector<[4]x4xi8>, sym_name = "negative_non_matching_dim_dynamic"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?x?x?xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 123 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg2, %arg0, %arg1, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x?x?xi8>, index, index, index, index, i8) -> vector<[4]x4xi8>
    "func.return"(%2) : (vector<[4]x4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

