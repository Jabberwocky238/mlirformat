"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (memref<4xf32>, memref<i32>) -> ()}> ({
    ^bb0(%arg0: memref<4xf32>, %arg1: memref<i32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %2 = "arith.constant"() <{value = 1 : index}> : () -> index
      %3 = "arith.constant"() <{value = 32 : i32}> : () -> i32
      %4 = "arith.divui"(%1, %3) : (i32, i32) -> i32
      %5 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index
      %6 = "index.castu"(%5) : (index) -> i32
      %7 = "index.castu"(%4) : (i32) -> index
      %8 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %9 = "memref.load"(%arg0, %5) : (memref<4xf32>, index) -> f32
      %10:2 = "scf.for"(%2, %7, %2, %8, %9) ({
      ^bb0(%arg2: index, %arg3: i32, %arg4: f32):
        %16 = "index.castu"(%arg2) : (index) -> i32
        %17 = "arith.muli"(%3, %16) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        %18 = "arith.addi"(%17, %6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        %19 = "index.castu"(%18) : (i32) -> index
        %20 = "memref.load"(%arg0, %19) : (memref<4xf32>, index) -> f32
        %21 = "arith.cmpf"(%20, %arg4) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (f32, f32) -> i1
        %22 = "arith.select"(%21, %18, %arg3) : (i1, i32, i32) -> i32
        %23 = "arith.select"(%21, %20, %arg4) : (i1, f32, f32) -> f32
        "scf.yield"(%22, %23) : (i32, f32) -> ()
      }) : (index, index, index, i32, f32) -> (i32, f32)
      %11 = "gpu.subgroup_reduce"(%10#1) <{cluster_stride = 1 : i32, op = #gpu<all_reduce_op maximumf>}> : (f32) -> f32
      %12 = "arith.cmpf"(%10#1, %11) <{fastmath = #arith.fastmath<none>, predicate = 1 : i64}> : (f32, f32) -> i1
      %13 = "spirv.GroupNonUniformBallot"(%12) <{execution_scope = #spirv.scope<Subgroup>}> : (i1) -> vector<4xi32>
      %14 = "spirv.GroupNonUniformBallotFindLSB"(%13) <{execution_scope = #spirv.scope<Subgroup>}> : (vector<4xi32>) -> i32
      %15 = "arith.cmpi"(%1, %6) <{predicate = 0 : i64}> : (i32, i32) -> i1
      "scf.if"(%15) ({
        "memref.store"(%10#0, %arg1) : (i32, memref<i32>) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 1, 1]>, sym_name = "argmax", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader, Groups, GroupNonUniformArithmetic, GroupNonUniformBallot], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} : () -> ()

