"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_module_0"}> ({
    "func.func"() <{function_type = () -> (index, index, index, index, index, index, index, index, index, index, index, index, index), sym_name = "gpu_index_ops"}> ({
      %2 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":4:12)
      %3 = "gpu.thread_id"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":5:12)
      %4 = "gpu.thread_id"() <{dimension = #gpu<dim z>}> : () -> index loc("<stdin>":6:12)
      %5 = "gpu.block_dim"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":7:12)
      %6 = "gpu.block_dim"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":8:12)
      %7 = "gpu.block_dim"() <{dimension = #gpu<dim z>}> : () -> index loc("<stdin>":9:12)
      %8 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":10:12)
      %9 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":11:12)
      %10 = "gpu.block_id"() <{dimension = #gpu<dim z>}> : () -> index loc("<stdin>":12:13)
      %11 = "gpu.grid_dim"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":13:13)
      %12 = "gpu.grid_dim"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":14:13)
      %13 = "gpu.grid_dim"() <{dimension = #gpu<dim z>}> : () -> index loc("<stdin>":15:13)
      %14 = "gpu.lane_id"() : () -> index loc("<stdin>":16:13)
      "func.return"(%2, %3, %4, %5, %6, %7, %8, %9, %10, %11, %12, %13, %14) : (index, index, index, index, index, index, index, index, index, index, index, index, index) -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "gpu.module"() <{sym_name = "test_module_1"}> ({
    "func.func"() <{function_type = (index) -> index, sym_name = "gpu_index_comp"}> ({
    ^bb0(%arg1: index loc("<stdin>":22:10)):
      %1 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":23:12)
      "func.return"(%1) : (index) -> () loc("<stdin>":24:7)
    }) : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":20:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":29:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["gpu.module"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":30:12)
      "transform.apply_conversion_patterns"(%0) <{illegal_dialects = ["gpu"], illegal_ops = ["llvm.cos", "llvm.exp", "llvm.exp2", "llvm.fabs", "llvm.fceil", "llvm.ffloor", "llvm.log", "llvm.log10", "llvm.log2", "llvm.pow", "llvm.sin", "llvm.sqrt"], legal_dialects = ["llvm", "memref", "nvvm"], legal_ops = ["gpu.module", "gpu.yield"], partial_conversion}> ({
        "transform.apply_conversion_patterns.dialect_to_llvm"() <{dialect_name = "arith"}> : () -> () loc("<stdin>":32:9)
        "transform.apply_conversion_patterns.dialect_to_llvm"() <{dialect_name = "cf"}> : () -> () loc("<stdin>":33:9)
        "transform.apply_conversion_patterns.vector.vector_to_llvm"() <{force_32bit_vector_indices = true, reassociate_fp_reductions = false, use_vector_alignment = false}> : () -> () loc("<stdin>":34:9)
        "transform.apply_conversion_patterns.func.func_to_llvm"() : () -> () loc("<stdin>":35:9)
        "transform.apply_conversion_patterns.dialect_to_llvm"() <{dialect_name = "memref"}> : () -> () loc("<stdin>":36:9)
        "transform.apply_conversion_patterns.gpu.gpu_to_nvvm"() <{benefit = 10 : i16}> : () -> () loc("<stdin>":37:9)
        "transform.apply_conversion_patterns.gpu.gpu_wmma_to_nvvm"() : () -> () loc("<stdin>":38:9)
        "transform.apply_conversion_patterns.gpu.gpu_subgroup_reduce_to_nvvm"() {has_redux = true} : () -> () loc("<stdin>":39:9)
        "transform.apply_conversion_patterns.nvgpu.nvgpu_to_nvvm"() : () -> () loc("<stdin>":40:9)
      }, {
        "transform.apply_conversion_patterns.memref.memref_to_llvm_type_converter"() <{index_bitwidth = 32 : i64}> {use_opaque_pointers = true} : () -> () loc("<stdin>":42:9)
      }) : (!transform.any_op) -> () loc("<stdin>":31:7)
      "transform.yield"() : () -> () loc("<stdin>":44:7)
    }) : () -> () loc("<stdin>":28:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":27:3)
}) : () -> () loc("<stdin>":1:1)
