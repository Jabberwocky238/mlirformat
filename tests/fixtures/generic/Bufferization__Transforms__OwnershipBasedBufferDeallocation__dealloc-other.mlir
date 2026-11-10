"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf16>) -> memref<?x?x?xf16>, sym_name = "no_interface_no_operands", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<?x?x?xf16>):
    %0 = "bufferization.to_buffer"(%arg0) : (tensor<?x?x?xf16>) -> memref<?x?x?xf16>
    "func.return"(%0) : (memref<?x?x?xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> memref<5xf32>, sym_name = "no_interface", sym_visibility = "private"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32>
    %1 = "test.forward_buffer"(%0) : (memref<5xf32>) -> memref<5xf32>
    "func.return"(%1) : (memref<5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<9x6xf32>) -> (), sym_name = "no_buffer_semantics_with_write_effect"}> ({
  ^bb0(%arg0: vector<9x6xf32>):
    "vector.print"(%arg0) <{punctuation = #vector.punctuation<newline>}> : (vector<9x6xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

