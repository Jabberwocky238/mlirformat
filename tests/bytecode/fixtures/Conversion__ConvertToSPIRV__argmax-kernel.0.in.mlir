"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (memref<4xf32>, memref<i32>) -> (), kernel}> ({
    ^bb0(%arg0: memref<4xf32> loc("<stdin>":4:10), %arg1: memref<i32> loc("<stdin>":4:32)):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:12)
      %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":6:12)
      %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":7:12)
      %3 = "arith.constant"() <{value = 32 : i32}> : () -> i32 loc("<stdin>":8:12)
      %4 = "arith.divui"(%1, %3) : (i32, i32) -> i32 loc("<stdin>":9:12)
      %5 = "gpu.thread_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":10:12)
      %6 = "index.castu"(%5) : (index) -> i32 loc("<stdin>":11:12)
      %7 = "index.castu"(%4) : (i32) -> index loc("<stdin>":12:12)
      %8 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":13:12)
      %9 = "memref.load"(%arg0, %5) : (memref<4xf32>, index) -> f32 loc("<stdin>":14:12)
      %10:2 = "scf.for"(%2, %7, %2, %8, %9) ({
      ^bb0(%arg2: index loc("<stdin>":16:12), %arg3: i32 loc("<stdin>":16:26), %arg4: f32 loc("<stdin>":16:38)):
        %16 = "index.castu"(%arg2) : (index) -> i32 loc("<stdin>":17:15)
        %17 = "arith.muli"(%3, %16) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":18:15)
        %18 = "arith.addi"(%17, %6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":19:15)
        %19 = "index.castu"(%18) : (i32) -> index loc("<stdin>":20:15)
        %20 = "memref.load"(%arg0, %19) : (memref<4xf32>, index) -> f32 loc("<stdin>":21:15)
        %21 = "arith.cmpf"(%20, %arg4) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (f32, f32) -> i1 loc("<stdin>":22:15)
        %22 = "arith.select"(%21, %18, %arg3) : (i1, i32, i32) -> i32 loc("<stdin>":23:15)
        %23 = "arith.select"(%21, %20, %arg4) : (i1, f32, f32) -> f32 loc("<stdin>":24:15)
        "scf.yield"(%22, %23) : (i32, f32) -> () loc("<stdin>":25:9)
      }) : (index, index, index, i32, f32) -> (i32, f32) loc("<stdin>":15:15)
      %11 = "gpu.subgroup_reduce"(%10#1) <{cluster_stride = 1 : i32, op = #gpu<all_reduce_op maximumf>}> : (f32) -> f32 loc("<stdin>":27:13)
      %12 = "arith.cmpf"(%10#1, %11) <{fastmath = #arith.fastmath<none>, predicate = 1 : i64}> : (f32, f32) -> i1 loc("<stdin>":28:13)
      %13 = "spirv.GroupNonUniformBallot"(%12) <{execution_scope = #spirv.scope<Subgroup>}> : (i1) -> vector<4xi32> loc("<stdin>":29:13)
      %14 = "spirv.GroupNonUniformBallotFindLSB"(%13) <{execution_scope = #spirv.scope<Subgroup>}> : (vector<4xi32>) -> i32 loc("<stdin>":30:13)
      %15 = "arith.cmpi"(%1, %6) <{predicate = 0 : i64}> : (i32, i32) -> i1 loc("<stdin>":31:13)
      "scf.if"(%15) ({
        "memref.store"(%10#0, %arg1) : (i32, memref<i32>) -> () loc("<stdin>":33:9)
        "scf.yield"() : () -> () loc("<stdin>":34:9)
      }, {
      }) : (i1) -> () loc("<stdin>":32:7)
      "gpu.return"() : () -> () loc("<stdin>":37:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 1, 1]>, sym_name = "argmax"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.3, [Shader, Groups, GroupNonUniformArithmetic, GroupNonUniformBallot], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
