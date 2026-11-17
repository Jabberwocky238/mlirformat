"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "vec1d_3"}> ({
  ^bb0(%arg1: memref<?x?xf32> loc("<stdin>":6:8), %arg2: memref<?x?x?xf32> loc("<stdin>":6:32)):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":8:10)
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":9:10)
    %4 = "memref.dim"(%arg1, %1) : (memref<?x?xf32>, index) -> index loc("<stdin>":10:10)
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?xf32>, index) -> index loc("<stdin>":11:10)
    %6 = "memref.dim"(%arg2, %3) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":12:10)
    "affine.for"(%4) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg3: index loc("<stdin>":14:10)):
      "affine.for"(%5) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
      ^bb0(%arg4: index loc("<stdin>":16:12)):
        %7 = "affine.load"(%arg1, %arg4, %arg3) <{map = affine_map<(d0, d1) -> (d0, d0 + d1)>}> : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":17:14)
        "affine.yield"() : () -> () loc("<stdin>":18:9)
      }) : (index) -> () loc("<stdin>":15:7)
      "affine.yield"() : () -> () loc("<stdin>":20:7)
    }) : (index) -> () loc("<stdin>":13:5)
    "func.return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":26:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["affine.for"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":27:12)
      "transform.affine.super_vectorize"(%0) <{vector_sizes = array<i64: 128>, vectorize_reductions = false}> : (!transform.any_op) -> () loc("<stdin>":28:7)
      "transform.yield"() : () -> () loc("<stdin>":29:7)
    }) : () -> () loc("<stdin>":25:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":24:3)
}) : () -> () loc("<stdin>":4:1)
