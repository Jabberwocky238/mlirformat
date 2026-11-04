"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (memref<i32>) -> ()}> ({
    ^bb0(%arg0: memref<i32>):
      %7 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %8 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %9 = "arith.constant"() <{value = 2 : i32}> : () -> i32
      %10 = "memref.atomic_rmw"(%8, %arg0) <{kind = 1 : i64}> : (i32, memref<i32>) -> i32
      "scf.while"() ({
        %11 = "memref.atomic_rmw"(%7, %arg0) <{kind = 1 : i64}> : (i32, memref<i32>) -> i32
        %12 = "arith.cmpi"(%11, %9) <{predicate = 2 : i64}> : (i32, i32) -> i1
        "scf.condition"(%12) : (i1) -> ()
      }, {
        "scf.yield"() : () -> ()
      }) : () -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "kernel", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "gpu.alloc"() <{hostShared, operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<i32>
    "memref.store"(%0, %2) : (i32, memref<i32>) -> ()
    %3 = "gpu.wait"() : () -> !gpu.async.token
    %4 = "gpu.wait"() : () -> !gpu.async.token
    %5 = "gpu.launch_func"(%3, %1, %1, %1, %1, %1, %1, %2) <{kernel = @kernels::@kernel, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0>}> : (!gpu.async.token, index, index, index, index, index, index, memref<i32>) -> !gpu.async.token
    %6 = "gpu.launch_func"(%4, %1, %1, %1, %1, %1, %1, %2) <{kernel = @kernels::@kernel, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0>}> : (!gpu.async.token, index, index, index, index, index, index, memref<i32>) -> !gpu.async.token
    "gpu.wait"(%5, %6) : (!gpu.async.token, !gpu.async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) {gpu.container_module} : () -> ()

