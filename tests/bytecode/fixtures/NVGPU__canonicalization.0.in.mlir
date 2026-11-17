"builtin.module"() ({
  "gpu.module"() <{sym_name = "main_kernel"}> ({
    "gpu.func"() <{function_type = (!nvgpu.tensormap.descriptor<tensor = memref<128x32xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>) -> (), kernel}> ({
    ^bb0(%arg0: !nvgpu.tensormap.descriptor<tensor = memref<128x32xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none> loc("<stdin>":4:10)):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:12)
      %1 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":6:12)
      %2 = "arith.cmpi"(%1, %0) <{predicate = 0 : i64}> : (index, index) -> i1 loc("<stdin>":7:12)
      %3 = "gpu.dynamic_shared_memory"() : () -> memref<?xi8, #gpu.address_space<workgroup>> loc("<stdin>":8:12)
      %4 = "memref.view"(%3, %0) : (memref<?xi8, #gpu.address_space<workgroup>>, index) -> memref<128x32xf32, #gpu.address_space<workgroup>> loc("<stdin>":9:12)
      "nvgpu.tma.async.store"(%4, %arg0, %0, %0, %2) <{operandSegmentSizes = array<i32: 1, 1, 2, 1>}> : (memref<128x32xf32, #gpu.address_space<workgroup>>, !nvgpu.tensormap.descriptor<tensor = memref<128x32xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>, index, index, i1) -> () loc("<stdin>":10:7)
      "nvvm.cp.async.bulk.commit.group"() : () -> () loc("<stdin>":11:7)
      "nvvm.cp.async.bulk.wait_group"() <{group = 0 : i32}> : () -> () loc("<stdin>":12:7)
      "gpu.return"() : () -> () loc("<stdin>":13:7)
    }) {gpu.known_block_size = array<i32: 128, 1, 1>, gpu.known_grid_size = array<i32: 1, 1, 1>, sym_name = "main_kernel"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
