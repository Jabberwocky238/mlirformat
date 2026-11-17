"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":3:10)
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":4:10)
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %4 = "arith.constant"() <{value = 1.230000e+02 : f32}> : () -> f32 loc("<stdin>":6:10)
    %5 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<word>}> : () -> index loc("<stdin>":7:10)
    %6 = "bufferization.alloc_tensor"(%5, %5) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xf32> loc("<stdin>":8:10)
    %7 = "scf.for"(%1, %5, %3, %6) ({
    ^bb0(%arg7: index loc("<stdin>":10:10), %arg8: tensor<?x?xf32> loc("<stdin>":10:24)):
      %18 = "scf.for"(%1, %5, %3, %arg8) ({
      ^bb0(%arg9: index loc("<stdin>":12:12), %arg10: tensor<?x?xf32> loc("<stdin>":12:26)):
        %19 = "tensor.insert"(%4, %arg10, %arg7, %arg9) : (f32, tensor<?x?xf32>, index, index) -> tensor<?x?xf32> loc("<stdin>":13:15)
        "scf.yield"(%19) : (tensor<?x?xf32>) -> () loc("<stdin>":14:9)
      }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":11:13)
      "scf.yield"(%18) : (tensor<?x?xf32>) -> () loc("<stdin>":16:7)
    }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":9:10)
    "scf.for"(%1, %5, %3) ({
    ^bb0(%arg5: index loc("<stdin>":19:10)):
      "vector.print"() <{punctuation = #vector.punctuation<open>}> : () -> () loc("<stdin>":20:7)
      "scf.for"(%1, %5, %3) ({
      ^bb0(%arg6: index loc("<stdin>":22:12)):
        %14 = "tensor.extract"(%7, %arg5, %arg6) : (tensor<?x?xf32>, index, index) -> f32 loc("<stdin>":23:15)
        "vector.print"(%14) <{punctuation = #vector.punctuation<no_punctuation>}> : (f32) -> () loc("<stdin>":24:9)
        %15 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":25:15)
        %16 = "arith.subi"(%5, %15) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":26:15)
        %17 = "arith.cmpi"(%arg6, %16) <{predicate = 6 : i64}> : (index, index) -> i1 loc("<stdin>":27:15)
        "scf.if"(%17) ({
          "vector.print"() <{punctuation = #vector.punctuation<comma>}> : () -> () loc("<stdin>":29:11)
          "scf.yield"() : () -> () loc("<stdin>":30:11)
        }, {
        }) : (i1) -> () loc("<stdin>":28:9)
        "scf.yield"() : () -> () loc("<stdin>":33:9)
      }) : (index, index, index) -> () loc("<stdin>":21:7)
      "vector.print"() <{punctuation = #vector.punctuation<close>}> : () -> () loc("<stdin>":35:7)
      "vector.print"() <{punctuation = #vector.punctuation<newline>}> : () -> () loc("<stdin>":36:7)
      "scf.yield"() : () -> () loc("<stdin>":37:7)
    }) : (index, index, index) -> () loc("<stdin>":18:5)
    %8 = "arith.constant"() <{value = 3.140000e+00 : f32}> : () -> f32 loc("<stdin>":39:10)
    %9 = "linalg.fill"(%8, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":41:10), %arg4: f32 loc("<stdin>":41:22)):
      "linalg.yield"(%arg3) : (f32) -> () loc("<stdin>":42:7)
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":40:10)
    "scf.for"(%1, %5, %3) ({
    ^bb0(%arg1: index loc("<stdin>":45:10)):
      "vector.print"() <{punctuation = #vector.punctuation<open>}> : () -> () loc("<stdin>":46:7)
      "scf.for"(%1, %5, %3) ({
      ^bb0(%arg2: index loc("<stdin>":48:12)):
        %10 = "tensor.extract"(%9, %arg1, %arg2) : (tensor<?x?xf32>, index, index) -> f32 loc("<stdin>":49:15)
        "vector.print"(%10) <{punctuation = #vector.punctuation<no_punctuation>}> : (f32) -> () loc("<stdin>":50:9)
        %11 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":51:15)
        %12 = "arith.subi"(%5, %11) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":52:15)
        %13 = "arith.cmpi"(%arg2, %12) <{predicate = 6 : i64}> : (index, index) -> i1 loc("<stdin>":53:15)
        "scf.if"(%13) ({
          "vector.print"() <{punctuation = #vector.punctuation<comma>}> : () -> () loc("<stdin>":55:11)
          "scf.yield"() : () -> () loc("<stdin>":56:11)
        }, {
        }) : (i1) -> () loc("<stdin>":54:9)
        "scf.yield"() : () -> () loc("<stdin>":59:9)
      }) : (index, index, index) -> () loc("<stdin>":47:7)
      "vector.print"() <{punctuation = #vector.punctuation<close>}> : () -> () loc("<stdin>":61:7)
      "vector.print"() <{punctuation = #vector.punctuation<newline>}> : () -> () loc("<stdin>":62:7)
      "scf.yield"() : () -> () loc("<stdin>":63:7)
    }) : (index, index, index) -> () loc("<stdin>":44:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SME: END OF TEST OUTPUT\0A"}> : () -> () loc("<stdin>":65:5)
    "func.return"() : () -> () loc("<stdin>":66:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":70:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":71:12)
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: true, true>, static_vector_sizes = array<i64: 4, 4>}> : (!transform.any_op) -> () loc("<stdin>":72:7)
      "transform.yield"() : () -> () loc("<stdin>":73:7)
    }) : () -> () loc("<stdin>":69:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":68:3)
}) : () -> () loc("<stdin>":1:1)
