"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (i1, i1) -> (), kernel}> ({
    ^bb0(%arg0: i1, %arg1: i1):
      %4 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      "cf.assert"(%arg1) <{msg = "passing assertion"}> : (i1) -> ()
      "gpu.printf"(%4) <{format = "thread %lld: print after passing assertion\0A"}> : (index) -> ()
      "cf.assert"(%arg0) <{msg = "failing assertion"}> : (i1) -> ()
      "gpu.printf"(%4) <{format = "thread %lld: print after failing assertion\0A"}> : (index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "test_assert"} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = false}> : () -> i1
    %3 = "arith.constant"() <{value = true}> : () -> i1
    "gpu.launch_func"(%1, %1, %1, %0, %1, %1, %2, %3) <{kernel = @kernels::@test_assert, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, 0>}> : (index, index, index, index, index, index, i1, i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) {gpu.container_module} : () -> ()

