"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = () -> (), kernel}> ({
      "gpu.return"() : () -> () loc("<stdin>":4:7)
    }) {sym_name = "kernel"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "foo", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (index) -> (), sym_name = "async"}> ({
  ^bb0(%arg6: index loc("<stdin>":10:8)):
    "gpu.launch_func"(%arg6, %arg6, %arg6, %arg6, %arg6, %arg6) <{kernel = @kernels::@kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> () loc("<stdin>":11:5)
    "gpu.launch_func"(%arg6, %arg6, %arg6, %arg6, %arg6, %arg6) <{kernel = @kernels::@kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> () loc("<stdin>":12:5)
    %15 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<7xf32> loc("<stdin>":13:11)
    "gpu.dealloc"(%15) : (memref<7xf32>) -> () loc("<stdin>":14:5)
    "func.call"() <{callee = @foo}> : () -> () loc("<stdin>":15:5)
    "func.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = (index) -> (), sym_name = "defer_wait"}> ({
  ^bb0(%arg5: index loc("<stdin>":19:8)):
    %13 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "gpu.launch_func"(%arg5, %arg5, %arg5, %arg5, %arg5, %arg5) <{kernel = @kernels::@kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> () loc("<stdin>":21:7)
      "async.yield"() : () -> () loc("<stdin>":22:7)
    }) : () -> !async.token loc("<stdin>":20:11)
    %14 = "async.execute"(%13) <{operandSegmentSizes = array<i32: 1, 0>}> ({
      "gpu.launch_func"(%arg5, %arg5, %arg5, %arg5, %arg5, %arg5) <{kernel = @kernels::@kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> () loc("<stdin>":25:7)
      "async.yield"() : () -> () loc("<stdin>":26:7)
    }) : (!async.token) -> !async.token loc("<stdin>":24:11)
    "async.await"(%14) : (!async.token) -> () loc("<stdin>":28:5)
    "func.return"() : () -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = (index) -> (), sym_name = "defer_wait_blocked_by_side_effect"}> ({
  ^bb0(%arg4: index loc("<stdin>":32:8)):
    %12 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "gpu.launch_func"(%arg4, %arg4, %arg4, %arg4, %arg4, %arg4) <{kernel = @kernels::@kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> () loc("<stdin>":34:7)
      "func.call"() <{callee = @foo}> : () -> () loc("<stdin>":35:7)
      "async.yield"() : () -> () loc("<stdin>":36:7)
    }) : () -> !async.token loc("<stdin>":33:11)
    "async.await"(%12) : (!async.token) -> () loc("<stdin>":38:5)
    "func.return"() : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":31:3)
  "func.func"() <{function_type = (index) -> (), sym_name = "defer_wait_pass_through"}> ({
  ^bb0(%arg3: index loc("<stdin>":42:8)):
    %10 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "gpu.launch_func"(%arg3, %arg3, %arg3, %arg3, %arg3, %arg3) <{kernel = @kernels::@kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> () loc("<stdin>":44:7)
      "async.yield"() : () -> () loc("<stdin>":45:7)
    }) : () -> !async.token loc("<stdin>":43:11)
    %11 = "async.execute"(%10) <{operandSegmentSizes = array<i32: 1, 0>}> ({
      "async.yield"() : () -> () loc("<stdin>":48:7)
    }) : (!async.token) -> !async.token loc("<stdin>":47:11)
    "async.await"(%11) : (!async.token) -> () loc("<stdin>":50:5)
    "func.return"() : () -> () loc("<stdin>":51:5)
  }) : () -> () loc("<stdin>":41:3)
  "func.func"() <{function_type = (index) -> index, sym_name = "async_execute_with_result"}> ({
  ^bb0(%arg2: index loc("<stdin>":54:8)):
    %8:2 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "gpu.launch_func"(%arg2, %arg2, %arg2, %arg2, %arg2, %arg2) <{kernel = @kernels::@kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> () loc("<stdin>":56:7)
      "async.yield"(%arg2) : (index) -> () loc("<stdin>":57:7)
    }) : () -> (!async.token, !async.value<index>) loc("<stdin>":55:12)
    "async.await"(%8#0) : (!async.token) -> () loc("<stdin>":59:5)
    %9 = "async.await"(%8#1) : (!async.value<index>) -> index loc("<stdin>":60:10)
    "func.return"(%9) : (index) -> () loc("<stdin>":61:5)
  }) : () -> () loc("<stdin>":53:3)
  "func.func"() <{function_type = (index) -> (), sym_name = "async_execute_no_use"}> ({
  ^bb0(%arg1: index loc("<stdin>":64:8)):
    %7 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "gpu.launch_func"(%arg1, %arg1, %arg1, %arg1, %arg1, %arg1) <{kernel = @kernels::@kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> () loc("<stdin>":66:7)
      "async.yield"() : () -> () loc("<stdin>":67:7)
    }) : () -> !async.token loc("<stdin>":65:10)
    "func.return"() : () -> () loc("<stdin>":69:5)
  }) : () -> () loc("<stdin>":63:3)
  "func.func"() <{function_type = (index) -> (), sym_name = "async_execute_fork"}> ({
  ^bb0(%arg0: index loc("<stdin>":72:8)):
    %4 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "gpu.launch_func"(%arg0, %arg0, %arg0, %arg0, %arg0, %arg0) <{kernel = @kernels::@kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> () loc("<stdin>":74:7)
      "async.yield"() : () -> () loc("<stdin>":75:7)
    }) : () -> !async.token loc("<stdin>":73:10)
    %5 = "async.execute"(%4) <{operandSegmentSizes = array<i32: 1, 0>}> ({
      "gpu.launch_func"(%arg0, %arg0, %arg0, %arg0, %arg0, %arg0) <{kernel = @kernels::@kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> () loc("<stdin>":78:7)
      "async.yield"() : () -> () loc("<stdin>":79:7)
    }) : (!async.token) -> !async.token loc("<stdin>":77:10)
    %6 = "async.execute"(%4) <{operandSegmentSizes = array<i32: 1, 0>}> ({
      "gpu.launch_func"(%arg0, %arg0, %arg0, %arg0, %arg0, %arg0) <{kernel = @kernels::@kernel, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>}> : (index, index, index, index, index, index) -> () loc("<stdin>":82:7)
      "async.yield"() : () -> () loc("<stdin>":83:7)
    }) : (!async.token) -> !async.token loc("<stdin>":81:10)
    "func.return"() : () -> () loc("<stdin>":85:5)
  }) : () -> () loc("<stdin>":71:3)
  "func.func"() <{function_type = () -> (), sym_name = "existing_tokens"}> ({
    %0 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":88:10)
    %1 = "gpu.wait"(%0) : (!gpu.async.token) -> !gpu.async.token loc("<stdin>":89:10)
    %2 = "gpu.alloc"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> memref<7xf32> loc("<stdin>":90:10)
    %3 = "gpu.dealloc"(%2) : (memref<7xf32>) -> !gpu.async.token loc("<stdin>":91:10)
    "gpu.wait"() : () -> () loc("<stdin>":92:5)
    "gpu.wait"() : () -> () loc("<stdin>":93:5)
    "func.return"() : () -> () loc("<stdin>":94:5)
  }) : () -> () loc("<stdin>":87:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
