"builtin.module"() ({
  "shard.grid"() <{shape = array<i64: 4, 2>, sym_name = "grid0"}> : () -> ()
  "shard.grid"() <{shape = array<i64: 4>, sym_name = "grid1"}> : () -> ()
  "func.func"() <{function_type = (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32>, sym_name = "all_reduce_arith_addf_endomorphism"}> ({
  ^bb0(%arg17: tensor<5xf32>, %arg18: tensor<5xf32>):
    %28 = "shard.all_reduce"(%arg17) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial sum>}> : (tensor<5xf32>) -> tensor<5xf32>
    %29 = "shard.all_reduce"(%arg18) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial sum>}> : (tensor<5xf32>) -> tensor<5xf32>
    %30 = "arith.addf"(%28, %29) <{fastmath = #arith.fastmath<none>}> : (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32>
    "func.return"(%30) : (tensor<5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5xf32>, tensor<5xf32>) -> (tensor<5xf32>, tensor<5xf32>), sym_name = "all_reduce_arith_addf_endomorphism_multiple_uses_of_result"}> ({
  ^bb0(%arg15: tensor<5xf32>, %arg16: tensor<5xf32>):
    %25 = "shard.all_reduce"(%arg15) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial sum>}> : (tensor<5xf32>) -> tensor<5xf32>
    %26 = "shard.all_reduce"(%arg16) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial sum>}> : (tensor<5xf32>) -> tensor<5xf32>
    %27 = "arith.addf"(%25, %26) <{fastmath = #arith.fastmath<none>}> : (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32>
    "func.return"(%27, %27) : (tensor<5xf32>, tensor<5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5xf32>, tensor<5xf32>) -> (tensor<5xf32>, tensor<5xf32>), sym_name = "all_reduce_arith_addf_endomorphism_multiple_uses_of_all_reduce_result"}> ({
  ^bb0(%arg13: tensor<5xf32>, %arg14: tensor<5xf32>):
    %22 = "shard.all_reduce"(%arg13) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial sum>}> : (tensor<5xf32>) -> tensor<5xf32>
    %23 = "shard.all_reduce"(%arg14) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial sum>}> : (tensor<5xf32>) -> tensor<5xf32>
    %24 = "arith.addf"(%22, %23) <{fastmath = #arith.fastmath<none>}> : (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32>
    "func.return"(%22, %24) : (tensor<5xf32>, tensor<5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32>, sym_name = "all_reduce_arith_addf_no_endomorphism_different_grid"}> ({
  ^bb0(%arg11: tensor<5xf32>, %arg12: tensor<5xf32>):
    %19 = "shard.all_reduce"(%arg11) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial sum>}> : (tensor<5xf32>) -> tensor<5xf32>
    %20 = "shard.all_reduce"(%arg12) <{grid = @grid1, grid_axes = array<i16: 0>, reduction = #shard<partial sum>}> : (tensor<5xf32>) -> tensor<5xf32>
    %21 = "arith.addf"(%19, %20) <{fastmath = #arith.fastmath<none>}> : (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32>
    "func.return"(%21) : (tensor<5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32>, sym_name = "all_reduce_arith_addf_no_endomorphism_different_grid_axes"}> ({
  ^bb0(%arg9: tensor<5xf32>, %arg10: tensor<5xf32>):
    %16 = "shard.all_reduce"(%arg9) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial sum>}> : (tensor<5xf32>) -> tensor<5xf32>
    %17 = "shard.all_reduce"(%arg10) <{grid = @grid0, grid_axes = array<i16: 1>, reduction = #shard<partial sum>}> : (tensor<5xf32>) -> tensor<5xf32>
    %18 = "arith.addf"(%16, %17) <{fastmath = #arith.fastmath<none>}> : (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32>
    "func.return"(%18) : (tensor<5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32>, sym_name = "all_reduce_arith_addf_no_endomorphism_wrong_reduction_kind"}> ({
  ^bb0(%arg7: tensor<5xf32>, %arg8: tensor<5xf32>):
    %13 = "shard.all_reduce"(%arg7) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial max>}> : (tensor<5xf32>) -> tensor<5xf32>
    %14 = "shard.all_reduce"(%arg8) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial sum>}> : (tensor<5xf32>) -> tensor<5xf32>
    %15 = "arith.addf"(%13, %14) <{fastmath = #arith.fastmath<none>}> : (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32>
    "func.return"(%15) : (tensor<5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf64>, sym_name = "all_reduce_arith_addf_no_endomorphism_different_operand_result_element_types"}> ({
  ^bb0(%arg5: tensor<5xf32>, %arg6: tensor<5xf32>):
    %10 = "shard.all_reduce"(%arg5) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial sum>}> : (tensor<5xf32>) -> tensor<5xf64>
    %11 = "shard.all_reduce"(%arg6) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial sum>}> : (tensor<5xf32>) -> tensor<5xf64>
    %12 = "arith.addf"(%10, %11) <{fastmath = #arith.fastmath<none>}> : (tensor<5xf64>, tensor<5xf64>) -> tensor<5xf64>
    "func.return"(%12) : (tensor<5xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32>, sym_name = "all_reduce_arith_minimumf_endomorphism"}> ({
  ^bb0(%arg3: tensor<5xf32>, %arg4: tensor<5xf32>):
    %7 = "shard.all_reduce"(%arg3) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial min>}> : (tensor<5xf32>) -> tensor<5xf32>
    %8 = "shard.all_reduce"(%arg4) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial min>}> : (tensor<5xf32>) -> tensor<5xf32>
    %9 = "arith.minimumf"(%7, %8) <{fastmath = #arith.fastmath<none>}> : (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32>
    "func.return"(%9) : (tensor<5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5xi32>, tensor<5xi32>) -> tensor<5xi32>, sym_name = "all_reduce_arith_minsi_endomorphism"}> ({
  ^bb0(%arg1: tensor<5xi32>, %arg2: tensor<5xi32>):
    %4 = "shard.all_reduce"(%arg1) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial min>}> : (tensor<5xi32>) -> tensor<5xi32>
    %5 = "shard.all_reduce"(%arg2) <{grid = @grid0, grid_axes = array<i16: 0>, reduction = #shard<partial min>}> : (tensor<5xi32>) -> tensor<5xi32>
    %6 = "arith.minsi"(%4, %5) : (tensor<5xi32>, tensor<5xi32>) -> tensor<5xi32>
    "func.return"(%6) : (tensor<5xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xi64>) -> i64, sym_name = "no_endomorphism_op"}> ({
  ^bb0(%arg0: tensor<2xi64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "tensor.extract"(%arg0, %0) : (tensor<2xi64>, index) -> i64
    %3 = "arith.maxsi"(%2, %1) : (i64, i64) -> i64
    "func.return"(%3) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

