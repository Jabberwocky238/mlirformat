"builtin.module"() ({
  "gpu.module"() <{sym_name = "main_kernel"}> ({
    "gpu.func"() <{function_type = (!nvgpu.tensormap.descriptor<tensor = memref<128x32xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>) -> ()}> ({
    ^bb0(%arg0: !nvgpu.tensormap.descriptor<tensor = memref<128x32xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      %2 = "arith.cmpi"(%1, %0) <{predicate = 0 : i64}> : (index, index) -> i1
      %3 = "gpu.dynamic_shared_memory"() : () -> memref<?xi8, #gpu.address_space<workgroup>>
      %4 = "memref.view"(%3, %0) : (memref<?xi8, #gpu.address_space<workgroup>>, index) -> memref<128x32xf32, #gpu.address_space<workgroup>>
      "nvgpu.tma.async.store"(%4, %arg0, %0, %0, %2) <{operandSegmentSizes = array<i32: 1, 1, 2, 1>}> : (memref<128x32xf32, #gpu.address_space<workgroup>>, !nvgpu.tensormap.descriptor<tensor = memref<128x32xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>, index, index, i1) -> ()
      "nvvm.cp.async.bulk.commit.group"() : () -> ()
      "nvvm.cp.async.bulk.wait_group"() <{group = 0 : i32}> : () -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, gpu.known_block_size = array<i32: 128, 1, 1>, gpu.known_grid_size = array<i32: 1, 1, 1>, sym_name = "main_kernel", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

