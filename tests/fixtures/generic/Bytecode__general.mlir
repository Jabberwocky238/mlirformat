"builtin.module"() ({
  "bytecode.test1"() ({
    "unregistered.op"() {test_attr = #test.dynamic_singleton} : () -> ()
    "bytecode.empty"() : () -> ()
    "bytecode.attributes"() {attra = 10 : i64, attrb = #bytecode.attr} : () -> ()
    %0 = "bytecode.sparse"() {value = sparse<[[2, 1], [1, 1], [1, 2]], [1.000000e+00, 5.000000e+00, 6.000000e+00]> : tensor<8x7xf32>} : () -> tensor<8x7xf32>
    "test.graph_region"() ({
      "bytecode.operands"(%4#0, %4#1, %4#2) : (i32, i64, i32) -> ()
      %4:3 = "bytecode.results"() : () -> (i32, i64, i32)
    }) : () -> ()
    "bytecode.branch"()[^bb1] : () -> ()
  ^bb1(%1: i32, %2: !bytecode.int, %3: !pdl.operation):  // pred: ^bb0
    "bytecode.regions"() ({
      "bytecode.operands"(%1, %2, %3) : (i32, !bytecode.int, !pdl.operation) -> ()
      "bytecode.return"() : () -> ()
    }) : () -> ()
    "bytecode.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

