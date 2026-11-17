"builtin.module"() ({
  "func.func"() <{function_type = (!spirv.ptr<i32, StorageBuffer>, i32) -> i32, sym_name = "atomic_and"}> ({
  ^bb0(%arg0: !spirv.ptr<i32, StorageBuffer> loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:47)):
    %0 = "spirv.AtomicAnd"(%arg0, %arg1) <{memory_scope = #spirv.scope<Device>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, StorageBuffer>, i32) -> i32 loc("<stdin>":4:10)
    "func.return"(%0) : (i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
