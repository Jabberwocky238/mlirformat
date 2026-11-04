"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1.230000e+02 : f32}> : () -> f32
    %5 = "vector.vscale"() : () -> index
    %6 = "arith.muli"(%1, %5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %7 = "bufferization.alloc_tensor"(%6) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?xf32>
    %8 = "scf.for"(%2, %6, %3, %7) ({
    ^bb0(%arg4: index, %arg5: tensor<?xf32>):
      %12 = "tensor.insert"(%4, %arg5, %arg4) : (f32, tensor<?xf32>, index) -> tensor<?xf32>
      "scf.yield"(%12) : (tensor<?xf32>) -> ()
    }) : (index, index, index, tensor<?xf32>) -> tensor<?xf32>
    %9 = "arith.constant"() <{value = 3.140000e+00 : f32}> : () -> f32
    %10 = "linalg.fill"(%9, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (f32, tensor<?xf32>) -> tensor<?xf32>
    "scf.for"(%2, %6, %3) ({
    ^bb0(%arg1: index):
      %11 = "tensor.extract"(%10, %arg1) : (tensor<?xf32>, index) -> f32
      "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: true>, static_vector_sizes = array<i64: 4>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

