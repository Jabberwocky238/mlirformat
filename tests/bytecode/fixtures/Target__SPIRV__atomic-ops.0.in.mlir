"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Physical64>, memory_model = #spirv.memory_model<OpenCL>, vce_triple = #spirv.vce<v1.0, [Kernel, Linkage, Addresses, AtomicFloat32AddEXT], [SPV_EXT_shader_atomic_float_add]>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32, sym_name = "test_int_atomics"}> ({
    ^bb0(%arg2: !spirv.ptr<i32, Workgroup> loc("<stdin>":4:10), %arg3: i32 loc("<stdin>":4:45), %arg4: i32 loc("<stdin>":4:57)):
      %2 = "spirv.AtomicCompareExchangeWeak"(%arg2, %arg3, %arg4) <{equal_semantics = #spirv.memory_semantics<Release>, memory_scope = #spirv.scope<Workgroup>, unequal_semantics = #spirv.memory_semantics<Acquire>}> : (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32 loc("<stdin>":5:12)
      %3 = "spirv.AtomicAnd"(%arg2, %arg3) <{memory_scope = #spirv.scope<Device>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, Workgroup>, i32) -> i32 loc("<stdin>":6:12)
      %4 = "spirv.AtomicIAdd"(%arg2, %arg3) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<Acquire>}> : (!spirv.ptr<i32, Workgroup>, i32) -> i32 loc("<stdin>":7:12)
      %5 = "spirv.AtomicIDecrement"(%arg2) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<Acquire>}> : (!spirv.ptr<i32, Workgroup>) -> i32 loc("<stdin>":8:12)
      %6 = "spirv.AtomicIIncrement"(%arg2) <{memory_scope = #spirv.scope<Device>, semantics = #spirv.memory_semantics<Release>}> : (!spirv.ptr<i32, Workgroup>) -> i32 loc("<stdin>":9:12)
      %7 = "spirv.AtomicISub"(%arg2, %arg3) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<Acquire>}> : (!spirv.ptr<i32, Workgroup>, i32) -> i32 loc("<stdin>":10:12)
      %8 = "spirv.AtomicOr"(%arg2, %arg3) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<AcquireRelease>}> : (!spirv.ptr<i32, Workgroup>, i32) -> i32 loc("<stdin>":11:12)
      %9 = "spirv.AtomicSMax"(%arg2, %arg3) <{memory_scope = #spirv.scope<Subgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, Workgroup>, i32) -> i32 loc("<stdin>":12:12)
      %10 = "spirv.AtomicSMin"(%arg2, %arg3) <{memory_scope = #spirv.scope<Device>, semantics = #spirv.memory_semantics<Release>}> : (!spirv.ptr<i32, Workgroup>, i32) -> i32 loc("<stdin>":13:13)
      %11 = "spirv.AtomicUMax"(%arg2, %arg3) <{memory_scope = #spirv.scope<Subgroup>, semantics = #spirv.memory_semantics<None>}> : (!spirv.ptr<i32, Workgroup>, i32) -> i32 loc("<stdin>":14:13)
      %12 = "spirv.AtomicUMin"(%arg2, %arg3) <{memory_scope = #spirv.scope<Device>, semantics = #spirv.memory_semantics<Release>}> : (!spirv.ptr<i32, Workgroup>, i32) -> i32 loc("<stdin>":15:13)
      %13 = "spirv.AtomicXor"(%arg2, %arg3) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<AcquireRelease>}> : (!spirv.ptr<i32, Workgroup>, i32) -> i32 loc("<stdin>":16:13)
      %14 = "spirv.AtomicCompareExchange"(%arg2, %arg3, %arg4) <{equal_semantics = #spirv.memory_semantics<Release>, memory_scope = #spirv.scope<Workgroup>, unequal_semantics = #spirv.memory_semantics<Acquire>}> : (!spirv.ptr<i32, Workgroup>, i32, i32) -> i32 loc("<stdin>":17:13)
      %15 = "spirv.AtomicExchange"(%arg2, %arg3) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<Release>}> : (!spirv.ptr<i32, Workgroup>, i32) -> i32 loc("<stdin>":18:13)
      %16 = "spirv.AtomicLoad"(%arg2) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<Acquire>}> : (!spirv.ptr<i32, Workgroup>) -> i32 loc("<stdin>":19:13)
      "spirv.AtomicStore"(%arg2, %arg3) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<Release>}> : (!spirv.ptr<i32, Workgroup>, i32) -> () loc("<stdin>":20:7)
      "spirv.ReturnValue"(%2) : (i32) -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<f32, Workgroup>, f32) -> f32, sym_name = "test_float_atomics"}> ({
    ^bb0(%arg0: !spirv.ptr<f32, Workgroup> loc("<stdin>":24:10), %arg1: f32 loc("<stdin>":24:45)):
      %0 = "spirv.EXT.AtomicFAdd"(%arg0, %arg1) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<Acquire>}> : (!spirv.ptr<f32, Workgroup>, f32) -> f32 loc("<stdin>":25:12)
      %1 = "spirv.AtomicLoad"(%arg0) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<Acquire>}> : (!spirv.ptr<f32, Workgroup>) -> f32 loc("<stdin>":26:12)
      "spirv.AtomicStore"(%arg0, %arg1) <{memory_scope = #spirv.scope<Workgroup>, semantics = #spirv.memory_semantics<Release>}> : (!spirv.ptr<f32, Workgroup>, f32) -> () loc("<stdin>":27:7)
      "spirv.ReturnValue"(%0) : (f32) -> () loc("<stdin>":28:7)
    }) : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
