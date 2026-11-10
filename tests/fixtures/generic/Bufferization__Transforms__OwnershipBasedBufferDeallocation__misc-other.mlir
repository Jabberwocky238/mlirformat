"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "func_with_assert"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.cmpi"(%arg0, %arg1) <{predicate = 2 : i64}> : (index, index) -> i1
    "cf.assert"(%0) <{msg = "%arg0 must be less than %arg1"}> : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<128xi8>) -> (), sym_name = "func_with_assume_alignment"}> ({
  ^bb0(%arg0: memref<128xi8>):
    %0 = "memref.assume_alignment"(%arg0) <{alignment = 64 : i32}> : (memref<128xi8>) -> memref<128xi8>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8xf32>) -> (), sym_name = "func_with_prefetch"}> ({
  ^bb0(%arg0: memref<4x8xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "memref.prefetch"(%arg0, %0, %0) <{isDataCache = true, isWrite = false, localityHint = 1 : i32}> : (memref<4x8xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "func_with_multi_block_memref_liveness"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x3xf32>
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x4xf32>
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // pred: ^bb1
    "test.read_buffer"(%0) : (memref<3x3xf32>) -> ()
    "test.read_buffer"(%1) : (memref<4x4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

