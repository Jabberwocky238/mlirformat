"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "make_alloca_loop_independent_static"}> ({
  ^bb0(%arg1: index loc("<stdin>":5:8)):
    %2 = "arith.constant"() <{value = 5.500000e+00 : f32}> : () -> f32 loc("<stdin>":6:10)
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %4 = "arith.constant"() <{value = 128 : index}> : () -> index loc("<stdin>":8:10)
    "scf.for"(%3, %4, %arg1) ({
    ^bb0(%arg2: index loc("<stdin>":10:10)):
      %5 = "affine.apply"(%arg2, %4) <{map = affine_map<(d0)[s0] -> (-d0 + s0)>}> : (index, index) -> index loc("<stdin>":11:12)
      %6 = "memref.alloca"(%5) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32> loc("<stdin>":12:12)
      "memref.store"(%2, %6, %3) : (f32, memref<?xf32>, index) -> () loc("<stdin>":13:7)
      %7 = "memref.dim"(%6, %3) : (memref<?xf32>, index) -> index loc("<stdin>":14:12)
      "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":15:7)
      "scf.yield"() : () -> () loc("<stdin>":16:7)
    }) : (index, index, index) -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":4:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":22:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["memref.alloca"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":23:12)
      %1 = "transform.memref.make_loop_independent"(%0) <{num_loops = 1 : i64}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":24:12)
      "transform.yield"() : () -> () loc("<stdin>":25:7)
    }) : () -> () loc("<stdin>":21:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":20:3)
}) : () -> () loc("<stdin>":3:1)
