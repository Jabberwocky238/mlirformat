"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":3:10)
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %4 = "arith.constant"() <{value = 1.230000e+02 : f32}> : () -> f32 loc("<stdin>":6:10)
    %5 = "vector.vscale"() : () -> index loc("<stdin>":7:10)
    %6 = "arith.muli"(%1, %5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":8:10)
    %7 = "bufferization.alloc_tensor"(%6) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?xf32> loc("<stdin>":9:10)
    %8 = "scf.for"(%2, %6, %3, %7) ({
    ^bb0(%arg4: index loc("<stdin>":11:10), %arg5: tensor<?xf32> loc("<stdin>":11:24)):
      %12 = "tensor.insert"(%4, %arg5, %arg4) : (f32, tensor<?xf32>, index) -> tensor<?xf32> loc("<stdin>":12:13)
      "scf.yield"(%12) : (tensor<?xf32>) -> () loc("<stdin>":13:7)
    }) : (index, index, index, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":10:10)
    %9 = "arith.constant"() <{value = 3.140000e+00 : f32}> : () -> f32 loc("<stdin>":15:10)
    %10 = "linalg.fill"(%9, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":17:10), %arg3: f32 loc("<stdin>":17:22)):
      "linalg.yield"(%arg2) : (f32) -> () loc("<stdin>":18:7)
    }) : (f32, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":16:11)
    "scf.for"(%2, %6, %3) ({
    ^bb0(%arg1: index loc("<stdin>":21:10)):
      %11 = "tensor.extract"(%10, %arg1) : (tensor<?xf32>, index) -> f32 loc("<stdin>":22:13)
      "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (f32) -> () loc("<stdin>":23:7)
      "scf.yield"() : () -> () loc("<stdin>":24:7)
    }) : (index, index, index) -> () loc("<stdin>":20:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT"}> : () -> () loc("<stdin>":26:5)
    "func.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":31:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":32:12)
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: true>, static_vector_sizes = array<i64: 4>}> : (!transform.any_op) -> () loc("<stdin>":33:7)
      "transform.yield"() : () -> () loc("<stdin>":34:7)
    }) : () -> () loc("<stdin>":30:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":29:3)
}) : () -> () loc("<stdin>":1:1)
