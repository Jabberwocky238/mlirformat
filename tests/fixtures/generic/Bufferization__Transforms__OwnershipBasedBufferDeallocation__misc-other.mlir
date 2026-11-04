"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "func_with_assert"}> ({
  ^bb0(%arg2: index, %arg3: index):
    %2 = "arith.cmpi"(%arg2, %arg3) <{predicate = 2 : i64}> : (index, index) -> i1
    "cf.assert"(%2) <{msg = "%arg0 must be less than %arg1"}> : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<128xi8>) -> (), sym_name = "func_with_assume_alignment"}> ({
  ^bb0(%arg1: memref<128xi8>):
    %1 = "memref.assume_alignment"(%arg1) <{alignment = 64 : i32}> : (memref<128xi8>) -> memref<128xi8>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x8xf32>) -> (), sym_name = "func_with_prefetch"}> ({
  ^bb0(%arg0: memref<4x8xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "memref.prefetch"(%arg0, %0, %0) <{isDataCache = true, isWrite = false, localityHint = 1 : i32}> : (memref<4x8xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

