"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "func.func"() <{function_type = (f32) -> (), sym_name = "hello"}> ({
    ^bb0(%arg0: f32):
      %2 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      %3 = "arith.constant"() <{value = 2 : i8}> : () -> i8
      "gpu.printf"(%2, %3, %arg0) <{format = "Hello from %lld, %d, %f\0A"}> : (index, i8, f32) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %0 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
      %1 = "func.constant"() <{value = @hello}> : () -> ((f32) -> ())
      "func.call_indirect"(%1, %0) : ((f32) -> (), f32) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "hello_indirect", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

