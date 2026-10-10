"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x16x16xf32>, index) -> f32, sym_name = "test_load"}> ({
  ^bb0(%arg1: memref<2x16x16xf32>, %arg2: index):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "memref.load"(%arg1, %arg2, %1, %2) : (memref<2x16x16xf32>, index, index, index) -> f32
    "func.return"(%3) : (f32) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.memref.extract_address_computations"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.debug.emit_remark_at"(%0) <{message = "transformed"}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x16x16xf32>, index) -> f32, sym_name = "test_load_nontemporal"}> ({
  ^bb0(%arg1: memref<2x16x16xf32>, %arg2: index):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "memref.load"(%arg1, %arg2, %1, %2) <{nontemporal = true}> : (memref<2x16x16xf32>, index, index, index) -> f32
    "func.return"(%3) : (f32) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.memref.extract_address_computations"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x16x16xf32>, index) -> (), sym_name = "test_store"}> ({
  ^bb0(%arg1: memref<2x16x16xf32>, %arg2: index):
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 8 : index}> : () -> index
    "memref.store"(%1, %arg1, %arg2, %2, %3) : (f32, memref<2x16x16xf32>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.memref.extract_address_computations"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x16x16xf32>, index) -> (), sym_name = "test_store_nontemporal"}> ({
  ^bb0(%arg1: memref<2x16x16xf32>, %arg2: index):
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 8 : index}> : () -> index
    "memref.store"(%1, %arg1, %arg2, %2, %3) <{nontemporal = true}> : (f32, memref<2x16x16xf32>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.memref.extract_address_computations"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>) -> f32, sym_name = "testWithLoop"}> ({
  ^bb0(%arg1: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>):
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, index) -> index
    %6 = "memref.dim"(%arg1, %3) : (memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, index) -> index
    %7 = "memref.dim"(%arg1, %4) : (memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, index) -> index
    %8 = "scf.for"(%2, %7, %3, %1) ({
    ^bb0(%arg2: index, %arg3: f32):
      %9 = "scf.for"(%2, %6, %3, %arg3) ({
      ^bb0(%arg4: index, %arg5: f32):
        %10 = "scf.for"(%2, %5, %3, %arg5) ({
        ^bb0(%arg6: index, %arg7: f32):
          %11 = "memref.load"(%arg1, %arg6, %arg4, %arg2) : (memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, index, index, index) -> f32
          %12 = "arith.addf"(%11, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "scf.yield"(%12) : (f32) -> ()
        }) : (index, index, index, f32) -> f32
        "scf.yield"(%10) : (f32) -> ()
      }) : (index, index, index, f32) -> f32
      "scf.yield"(%9) : (f32) -> ()
    }) : (index, index, index, f32) -> f32
    "func.return"(%8) : (f32) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.memref.extract_address_computations"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x32x32xf16, 3>, index, index, index) -> vector<4x2xf16>, sym_name = "test_ldmatrix"}> ({
  ^bb0(%arg1: memref<4x32x32xf16, 3>, %arg2: index, %arg3: index, %arg4: index):
    %1 = "nvgpu.ldmatrix"(%arg1, %arg2, %arg3, %arg4) <{numTiles = 4 : i32, transpose = false}> : (memref<4x32x32xf16, 3>, index, index, index) -> vector<4x2xf16>
    "func.return"(%1) : (vector<4x2xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.memref.extract_address_computations"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf16, 3>, index, index, index) -> vector<4x2xf16>, sym_name = "test_ldmatrix"}> ({
  ^bb0(%arg1: memref<?x?x?xf16, 3>, %arg2: index, %arg3: index, %arg4: index):
    %1 = "nvgpu.ldmatrix"(%arg1, %arg2, %arg3, %arg4) <{numTiles = 4 : i32, transpose = false}> : (memref<?x?x?xf16, 3>, index, index, index) -> vector<4x2xf16>
    "func.return"(%1) : (vector<4x2xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.memref.extract_address_computations"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf16>, index, index, index) -> vector<4x2xf16>, sym_name = "test_transfer_read_op"}> ({
  ^bb0(%arg1: memref<?x?x?xf16>, %arg2: index, %arg3: index, %arg4: index):
    %1 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %2 = "vector.transfer_read"(%arg1, %arg2, %arg3, %arg4, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (memref<?x?x?xf16>, index, index, index, f16) -> vector<4x2xf16>
    "func.return"(%2) : (vector<4x2xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.memref.extract_address_computations"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf16>, index, index, index) -> vector<4x2xf16>, sym_name = "test_transfer_read_op_with_tensor"}> ({
  ^bb0(%arg1: tensor<?x?x?xf16>, %arg2: index, %arg3: index, %arg4: index):
    %1 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %2 = "vector.transfer_read"(%arg1, %arg2, %arg3, %arg4, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (tensor<?x?x?xf16>, index, index, index, f16) -> vector<4x2xf16>
    "func.return"(%2) : (vector<4x2xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.memref.extract_address_computations"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf16>, index, index, index) -> (), sym_name = "test_transfer_write_op"}> ({
  ^bb0(%arg1: memref<?x?x?xf16>, %arg2: index, %arg3: index, %arg4: index):
    %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4x2xf16>}> : () -> vector<4x2xf16>
    "vector.transfer_write"(%1, %arg1, %arg2, %arg3, %arg4) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map}> : (vector<4x2xf16>, memref<?x?x?xf16>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.memref.extract_address_computations"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf16, strided<[329, 26, 12], offset: ?>>, index, index, index) -> (), sym_name = "test_transfer_write_op_with_strides"}> ({
  ^bb0(%arg1: memref<?x?x?xf16, strided<[329, 26, 12], offset: ?>>, %arg2: index, %arg3: index, %arg4: index):
    %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4x2xf16>}> : () -> vector<4x2xf16>
    "vector.transfer_write"(%1, %arg1, %arg2, %arg3, %arg4) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map}> : (vector<4x2xf16>, memref<?x?x?xf16, strided<[329, 26, 12], offset: ?>>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.memref.extract_address_computations"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf16>, index, index, index) -> tensor<?x?x?xf16>, sym_name = "test_transfer_write_op_with_tensor"}> ({
  ^bb0(%arg1: tensor<?x?x?xf16>, %arg2: index, %arg3: index, %arg4: index):
    %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4x2xf16>}> : () -> vector<4x2xf16>
    %2 = "vector.transfer_write"(%1, %arg1, %arg2, %arg3, %arg4) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map}> : (vector<4x2xf16>, tensor<?x?x?xf16>, index, index, index) -> tensor<?x?x?xf16>
    "func.return"(%2) : (tensor<?x?x?xf16>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.memref.extract_address_computations"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

