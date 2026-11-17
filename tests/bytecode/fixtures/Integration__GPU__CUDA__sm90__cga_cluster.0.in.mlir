"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %21 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":3:11)
    %22 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":4:11)
    %23 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":5:11)
    "gpu.launch_func"(%23, %23, %21, %21, %21, %21, %22, %22, %21) <{kernel = @gpumodule::@kernel_cluster, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>}> : (index, index, index, index, index, index, index, index, index) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "gpu.module"() <{sym_name = "gpumodule"}> ({
    "gpu.func"() <{function_type = () -> (), kernel}> ({
      %0 = "gpu.cluster_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":11:12)
      %1 = "gpu.cluster_id"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":12:12)
      %2 = "gpu.cluster_id"() <{dimension = #gpu<dim z>}> : () -> index loc("<stdin>":13:12)
      %3 = "gpu.cluster_dim_blocks"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":14:12)
      %4 = "gpu.cluster_dim_blocks"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":15:12)
      %5 = "gpu.cluster_dim_blocks"() <{dimension = #gpu<dim z>}> : () -> index loc("<stdin>":16:12)
      %6 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":17:12)
      %7 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":18:12)
      %8 = "gpu.block_id"() <{dimension = #gpu<dim z>}> : () -> index loc("<stdin>":19:12)
      %9 = "index.casts"(%0) : (index) -> i32 loc("<stdin>":20:12)
      %10 = "index.casts"(%1) : (index) -> i32 loc("<stdin>":21:13)
      %11 = "index.casts"(%2) : (index) -> i32 loc("<stdin>":22:13)
      %12 = "index.casts"(%3) : (index) -> i32 loc("<stdin>":23:13)
      %13 = "index.casts"(%4) : (index) -> i32 loc("<stdin>":24:13)
      %14 = "index.casts"(%5) : (index) -> i32 loc("<stdin>":25:13)
      %15 = "index.casts"(%6) : (index) -> i32 loc("<stdin>":26:13)
      %16 = "index.casts"(%7) : (index) -> i32 loc("<stdin>":27:13)
      %17 = "index.casts"(%8) : (index) -> i32 loc("<stdin>":28:13)
      %18 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":29:13)
      %19 = "arith.cmpi"(%6, %18) <{predicate = 0 : i64}> : (index, index) -> i1 loc("<stdin>":30:13)
      %20 = "arith.cmpi"(%7, %18) <{predicate = 0 : i64}> : (index, index) -> i1 loc("<stdin>":31:13)
      "scf.if"(%19) ({
        "scf.if"(%20) ({
          "gpu.printf"(%9, %10, %11, %12, %13, %14, %15, %16, %17) <{format = "clusterIdx: (%d, %d, %d) in Cluster Dimension: (%d, %d, %d) blockIdx: (%d, %d, %d) \0A"}> : (i32, i32, i32, i32, i32, i32, i32, i32, i32) -> () loc("<stdin>":34:11)
          "scf.yield"() : () -> () loc("<stdin>":35:11)
        }, {
        }) : (i1) -> () loc("<stdin>":33:9)
        "scf.yield"() : () -> () loc("<stdin>":38:9)
      }, {
      }) : (i1) -> () loc("<stdin>":32:7)
      "gpu.return"() : () -> () loc("<stdin>":41:7)
    }) {gpu.known_block_size = array<i32: 1, 1, 1>, gpu.known_grid_size = array<i32: 4, 4, 1>, sym_name = "kernel_cluster"} : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":9:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
