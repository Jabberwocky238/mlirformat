"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %21 = "arith.constant"() <{value = 1 : index}> : () -> index
    %22 = "arith.constant"() <{value = 2 : index}> : () -> index
    %23 = "arith.constant"() <{value = 4 : index}> : () -> index
    "gpu.launch_func"(%23, %23, %21, %21, %21, %21, %22, %22, %21) <{kernel = @gpumodule::@kernel_cluster, operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>}> : (index, index, index, index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "gpumodule"}> ({
    "gpu.func"() <{function_type = () -> (), kernel}> ({
      %0 = "gpu.cluster_id"() <{dimension = #gpu<dim x>}> : () -> index
      %1 = "gpu.cluster_id"() <{dimension = #gpu<dim y>}> : () -> index
      %2 = "gpu.cluster_id"() <{dimension = #gpu<dim z>}> : () -> index
      %3 = "gpu.cluster_dim_blocks"() <{dimension = #gpu<dim x>}> : () -> index
      %4 = "gpu.cluster_dim_blocks"() <{dimension = #gpu<dim y>}> : () -> index
      %5 = "gpu.cluster_dim_blocks"() <{dimension = #gpu<dim z>}> : () -> index
      %6 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %7 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %8 = "gpu.block_id"() <{dimension = #gpu<dim z>}> : () -> index
      %9 = "index.casts"(%0) : (index) -> i32
      %10 = "index.casts"(%1) : (index) -> i32
      %11 = "index.casts"(%2) : (index) -> i32
      %12 = "index.casts"(%3) : (index) -> i32
      %13 = "index.casts"(%4) : (index) -> i32
      %14 = "index.casts"(%5) : (index) -> i32
      %15 = "index.casts"(%6) : (index) -> i32
      %16 = "index.casts"(%7) : (index) -> i32
      %17 = "index.casts"(%8) : (index) -> i32
      %18 = "arith.constant"() <{value = 3 : index}> : () -> index
      %19 = "arith.cmpi"(%6, %18) <{predicate = 0 : i64}> : (index, index) -> i1
      %20 = "arith.cmpi"(%7, %18) <{predicate = 0 : i64}> : (index, index) -> i1
      "scf.if"(%19) ({
        "scf.if"(%20) ({
          "gpu.printf"(%9, %10, %11, %12, %13, %14, %15, %16, %17) <{format = "clusterIdx: (%d, %d, %d) in Cluster Dimension: (%d, %d, %d) blockIdx: (%d, %d, %d) \0A"}> : (i32, i32, i32, i32, i32, i32, i32, i32, i32) -> ()
          "scf.yield"() : () -> ()
        }, {
        }) : (i1) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.known_block_size = array<i32: 1, 1, 1>, gpu.known_grid_size = array<i32: 4, 4, 1>, sym_name = "kernel_cluster"} : () -> ()
  }) : () -> ()
}) {gpu.container_module} : () -> ()

