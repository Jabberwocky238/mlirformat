module {
  gpu.module @test_module_0 {
    func.func @gpu_index_ops() -> (index, index, index, index, index, index, index, index, index, index, index, index, index) {
      %thread_id_x = gpu.thread_id x
      %thread_id_y = gpu.thread_id y
      %thread_id_z = gpu.thread_id z
      %block_dim_x = gpu.block_dim x
      %block_dim_y = gpu.block_dim y
      %block_dim_z = gpu.block_dim z
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %block_id_z = gpu.block_id z
      %grid_dim_x = gpu.grid_dim x
      %grid_dim_y = gpu.grid_dim y
      %grid_dim_z = gpu.grid_dim z
      %0 = gpu.lane_id
      return %thread_id_x, %thread_id_y, %thread_id_z, %block_dim_x, %block_dim_y, %block_dim_z, %block_id_x, %block_id_y, %block_id_z, %grid_dim_x, %grid_dim_y, %grid_dim_z, %0 : index, index, index, index, index, index, index, index, index, index, index, index, index
    }
  }
  gpu.module @test_module_1 {
    func.func @gpu_index_comp(%arg0: index) -> index {
      %0 = arith.addi %arg0, %arg0 : index
      return %0 : index
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["gpu.module"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_conversion_patterns to %0 {
        transform.apply_conversion_patterns.dialect_to_llvm "arith"
        transform.apply_conversion_patterns.dialect_to_llvm "cf"
        transform.apply_conversion_patterns.vector.vector_to_llvm
        transform.apply_conversion_patterns.func.func_to_llvm
        transform.apply_conversion_patterns.dialect_to_llvm "memref"
        transform.apply_conversion_patterns.gpu.gpu_to_nvvm {benefit = 10 : i16}
        transform.apply_conversion_patterns.gpu.gpu_wmma_to_nvvm
        transform.apply_conversion_patterns.gpu.gpu_subgroup_reduce_to_nvvm {has_redux = true}
        transform.apply_conversion_patterns.nvgpu.nvgpu_to_nvvm
      } with type_converter {
        transform.apply_conversion_patterns.memref.memref_to_llvm_type_converter {index_bitwidth = 32 : i64, use_opaque_pointers = true}
      } {illegal_dialects = ["gpu"], illegal_ops = ["llvm.cos", "llvm.exp", "llvm.exp2", "llvm.fabs", "llvm.fceil", "llvm.ffloor", "llvm.log", "llvm.log10", "llvm.log2", "llvm.pow", "llvm.sin", "llvm.sqrt"], legal_dialects = ["llvm", "memref", "nvvm"], legal_ops = ["gpu.module", "gpu.yield"], partial_conversion} : !transform.any_op
      transform.yield 
    }
  }
}

