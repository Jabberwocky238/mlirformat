"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (i1, i1) -> (), kernel}> ({
    ^bb0(%arg0: i1 loc("<stdin>":4:10), %arg1: i1 loc("<stdin>":4:21)):
      %4 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":5:12)
      "cf.assert"(%arg1) <{msg = "passing assertion"}> : (i1) -> () loc("<stdin>":6:7)
      "gpu.printf"(%4) <{format = "thread %lld: print after passing assertion\0A"}> : (index) -> () loc("<stdin>":7:7)
      "cf.assert"(%arg0) <{msg = "failing assertion"}> : (i1) -> () loc("<stdin>":8:7)
      "gpu.printf"(%4) <{format = "thread %lld: print after failing assertion\0A"}> : (index) -> () loc("<stdin>":9:7)
      "gpu.return"() : () -> () loc("<stdin>":10:7)
    }) {sym_name = "test_assert"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":14:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":15:10)
    %2 = "arith.constant"() <{value = false}> : () -> i1 loc("<stdin>":16:10)
    %3 = "arith.constant"() <{value = true}> : () -> i1 loc("<stdin>":17:10)
    "gpu.launch_func"(%1, %1, %1, %0, %1, %1, %2, %3) <{kernel = @kernels::@test_assert, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 0>}> : (index, index, index, index, index, index, i1, i1) -> () loc("<stdin>":18:5)
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":13:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
