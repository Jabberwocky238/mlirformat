"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    %2 = "memref.dim"(%1, %0) : (memref<1xf32>, index) -> index
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

