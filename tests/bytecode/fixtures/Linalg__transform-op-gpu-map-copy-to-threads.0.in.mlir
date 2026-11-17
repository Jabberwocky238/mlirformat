"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8xf16>, tensor<8xf16>) -> tensor<8xf16>, sym_name = "copy_1d_8xf16"}> ({
  ^bb0(%arg1: tensor<8xf16> loc("<stdin>":3:8), %arg2: tensor<8xf16> loc("<stdin>":3:30)):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f16 loc("<stdin>":5:10), %arg4: f16 loc("<stdin>":5:22)):
      "linalg.yield"(%arg3) : (f16) -> () loc("<stdin>":6:7)
    }) : (tensor<8xf16>, tensor<8xf16>) -> tensor<8xf16> loc("<stdin>":4:10)
    "func.return"(%2) : (tensor<8xf16>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":12:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":13:12)
      %1:2 = "transform.structured.gpu.map_copy_to_threads"(%0) <{desired_bit_alignment = 128 : i64, total_num_threads = 32 : i64}> : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">) loc("<stdin>":14:14)
      "transform.yield"() : () -> () loc("<stdin>":15:7)
    }) : () -> () loc("<stdin>":11:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":1:1)
