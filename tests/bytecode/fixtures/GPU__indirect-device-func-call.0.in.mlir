"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "func.func"() <{function_type = (f32) -> (), sym_name = "hello"}> ({
    ^bb0(%arg0: f32 loc("<stdin>":4:10)):
      %2 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":5:12)
      %3 = "arith.constant"() <{value = 2 : i8}> : () -> i8 loc("<stdin>":6:12)
      "gpu.printf"(%2, %3, %arg0) <{format = "Hello from %lld, %d, %f\0A"}> : (index, i8, f32) -> () loc("<stdin>":7:7)
      "func.return"() : () -> () loc("<stdin>":8:7)
    }) : () -> () loc("<stdin>":3:5)
    "gpu.func"() <{function_type = () -> (), kernel}> ({
      %0 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32 loc("<stdin>":11:12)
      %1 = "func.constant"() <{value = @hello}> : () -> ((f32) -> ()) loc("<stdin>":12:12)
      "func.call_indirect"(%1, %0) : ((f32) -> (), f32) -> () loc("<stdin>":13:7)
      "gpu.return"() : () -> () loc("<stdin>":14:7)
    }) {sym_name = "hello_indirect"} : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
