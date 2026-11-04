"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "auto_dealloc"}> ({
    %0 = "arith.constant"() <{value = 10 : index}> : () -> index
    %1 = "arith.constant"() <{value = 100 : index}> : () -> index
    %2 = "memref.alloc"(%0) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi32>
    %3 = "memref.realloc"(%2, %1) : (memref<?xi32>, index) -> memref<?xi32>
    "test.read_buffer"(%3) : (memref<?xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi32>, i1) -> (), sym_name = "auto_dealloc_inside_nested_region"}> ({
  ^bb0(%arg0: memref<?xi32>, %arg1: i1):
    %0 = "arith.constant"() <{value = 100 : index}> : () -> index
    %1 = "scf.if"(%arg1) ({
      %2 = "memref.realloc"(%arg0, %0) : (memref<?xi32>, index) -> memref<?xi32>
      "scf.yield"(%2) : (memref<?xi32>) -> ()
    }, {
      "scf.yield"(%arg0) : (memref<?xi32>) -> ()
    }) : (i1) -> memref<?xi32>
    "test.read_buffer"(%1) : (memref<?xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

