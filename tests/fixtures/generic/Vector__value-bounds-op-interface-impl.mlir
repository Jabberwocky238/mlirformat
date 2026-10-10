#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, vector<5xf32>, index) -> index, sym_name = "vector_transfer_write"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: vector<5xf32>, %arg2: index):
    %0 = "vector.transfer_write"(%arg1, %arg0, %arg2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<5xf32>, tensor<?xf32>, index) -> tensor<?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

