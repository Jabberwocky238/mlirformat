"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1.230000e+02 : f32}> : () -> f32
    %5 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<word>}> : () -> index
    %6 = "bufferization.alloc_tensor"(%5, %5) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xf32>
    %7 = "scf.for"(%1, %5, %3, %6) ({
    ^bb0(%arg7: index, %arg8: tensor<?x?xf32>):
      %18 = "scf.for"(%1, %5, %3, %arg8) ({
      ^bb0(%arg9: index, %arg10: tensor<?x?xf32>):
        %19 = "tensor.insert"(%4, %arg10, %arg7, %arg9) : (f32, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
        "scf.yield"(%19) : (tensor<?x?xf32>) -> ()
      }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
      "scf.yield"(%18) : (tensor<?x?xf32>) -> ()
    }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
    "scf.for"(%1, %5, %3) ({
    ^bb0(%arg5: index):
      "vector.print"() <{punctuation = #vector.punctuation<open>}> : () -> ()
      "scf.for"(%1, %5, %3) ({
      ^bb0(%arg6: index):
        %14 = "tensor.extract"(%7, %arg5, %arg6) : (tensor<?x?xf32>, index, index) -> f32
        "vector.print"(%14) <{punctuation = #vector.punctuation<no_punctuation>}> : (f32) -> ()
        %15 = "arith.constant"() <{value = 1 : index}> : () -> index
        %16 = "arith.subi"(%5, %15) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %17 = "arith.cmpi"(%arg6, %16) <{predicate = 6 : i64}> : (index, index) -> i1
        "scf.if"(%17) ({
          "vector.print"() <{punctuation = #vector.punctuation<comma>}> : () -> ()
          "scf.yield"() : () -> ()
        }, {
        }) : (i1) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "vector.print"() <{punctuation = #vector.punctuation<close>}> : () -> ()
      "vector.print"() <{punctuation = #vector.punctuation<newline>}> : () -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %8 = "arith.constant"() <{value = 3.140000e+00 : f32}> : () -> f32
    %9 = "linalg.fill"(%8, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    "scf.for"(%1, %5, %3) ({
    ^bb0(%arg1: index):
      "vector.print"() <{punctuation = #vector.punctuation<open>}> : () -> ()
      "scf.for"(%1, %5, %3) ({
      ^bb0(%arg2: index):
        %10 = "tensor.extract"(%9, %arg1, %arg2) : (tensor<?x?xf32>, index, index) -> f32
        "vector.print"(%10) <{punctuation = #vector.punctuation<no_punctuation>}> : (f32) -> ()
        %11 = "arith.constant"() <{value = 1 : index}> : () -> index
        %12 = "arith.subi"(%5, %11) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %13 = "arith.cmpi"(%arg2, %12) <{predicate = 6 : i64}> : (index, index) -> i1
        "scf.if"(%13) ({
          "vector.print"() <{punctuation = #vector.punctuation<comma>}> : () -> ()
          "scf.yield"() : () -> ()
        }, {
        }) : (i1) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "vector.print"() <{punctuation = #vector.punctuation<close>}> : () -> ()
      "vector.print"() <{punctuation = #vector.punctuation<newline>}> : () -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SME: END OF TEST OUTPUT\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: true, true>, static_vector_sizes = array<i64: 4, 4>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

