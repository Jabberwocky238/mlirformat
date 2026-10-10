"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (vector<5xf16>) -> ()}> ({
    ^bb0(%arg13: vector<5xf16>):
      %16 = "gpu.subgroup_reduce"(%arg13) <{cluster_stride = 1 : i32, op = #gpu<all_reduce_op add>}> : (vector<5xf16>) -> vector<5xf16>
      "test.consume"(%16) : (vector<5xf16>) -> ()
      %17 = "gpu.subgroup_reduce"(%arg13) <{cluster_stride = 1 : i32, op = #gpu<all_reduce_op mul>, uniform}> : (vector<5xf16>) -> vector<5xf16>
      "test.consume"(%17) : (vector<5xf16>) -> ()
      %18 = "gpu.subgroup_reduce"(%arg13) <{cluster_size = 4 : i32, cluster_stride = 1 : i32, op = #gpu<all_reduce_op mul>}> : (vector<5xf16>) -> vector<5xf16>
      "test.consume"(%18) : (vector<5xf16>) -> ()
      %19 = "gpu.subgroup_reduce"(%arg13) <{cluster_size = 4 : i32, cluster_stride = 2 : i32, op = #gpu<all_reduce_op mul>, uniform}> : (vector<5xf16>) -> vector<5xf16>
      "test.consume"(%19) : (vector<5xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "kernel0", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (vector<1xf32>) -> ()}> ({
    ^bb0(%arg12: vector<1xf32>):
      %12 = "gpu.subgroup_reduce"(%arg12) <{cluster_stride = 1 : i32, op = #gpu<all_reduce_op add>}> : (vector<1xf32>) -> vector<1xf32>
      "test.consume"(%12) : (vector<1xf32>) -> ()
      %13 = "gpu.subgroup_reduce"(%arg12) <{cluster_stride = 1 : i32, op = #gpu<all_reduce_op add>, uniform}> : (vector<1xf32>) -> vector<1xf32>
      "test.consume"(%13) : (vector<1xf32>) -> ()
      %14 = "gpu.subgroup_reduce"(%arg12) <{cluster_size = 8 : i32, cluster_stride = 1 : i32, op = #gpu<all_reduce_op add>}> : (vector<1xf32>) -> vector<1xf32>
      "test.consume"(%14) : (vector<1xf32>) -> ()
      %15 = "gpu.subgroup_reduce"(%arg12) <{cluster_size = 8 : i32, cluster_stride = 4 : i32, op = #gpu<all_reduce_op add>, uniform}> : (vector<1xf32>) -> vector<1xf32>
      "test.consume"(%15) : (vector<1xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "kernel1", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (vector<3xi8>, vector<4xi8>) -> ()}> ({
    ^bb0(%arg10: vector<3xi8>, %arg11: vector<4xi8>):
      %10 = "gpu.subgroup_reduce"(%arg10) <{cluster_stride = 1 : i32, op = #gpu<all_reduce_op add>}> : (vector<3xi8>) -> vector<3xi8>
      "test.consume"(%10) : (vector<3xi8>) -> ()
      %11 = "gpu.subgroup_reduce"(%arg11) <{cluster_stride = 1 : i32, op = #gpu<all_reduce_op add>}> : (vector<4xi8>) -> vector<4xi8>
      "test.consume"(%11) : (vector<4xi8>) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "kernel2", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (i32) -> ()}> ({
    ^bb0(%arg9: i32):
      %9 = "gpu.subgroup_reduce"(%arg9) <{cluster_stride = 1 : i32, op = #gpu<all_reduce_op add>}> : (i32) -> i32
      "test.consume"(%9) : (i32) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "kernel3", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (i32) -> ()}> ({
    ^bb0(%arg8: i32):
      %8 = "gpu.subgroup_reduce"(%arg8) <{cluster_size = 8 : i32, cluster_stride = 1 : i32, op = #gpu<all_reduce_op add>}> : (i32) -> i32
      "test.consume"(%8) : (i32) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "kernel3_clustered", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (i32) -> ()}> ({
    ^bb0(%arg7: i32):
      %7 = "gpu.subgroup_reduce"(%arg7) <{cluster_size = 8 : i32, cluster_stride = 4 : i32, op = #gpu<all_reduce_op add>}> : (i32) -> i32
      "test.consume"(%7) : (i32) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "kernel3_clustered_strided", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (vector<2xf16>) -> ()}> ({
    ^bb0(%arg6: vector<2xf16>):
      %6 = "gpu.subgroup_reduce"(%arg6) <{cluster_stride = 1 : i32, op = #gpu<all_reduce_op add>}> : (vector<2xf16>) -> vector<2xf16>
      "test.consume"(%6) : (vector<2xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "kernel4", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (vector<2xf16>) -> ()}> ({
    ^bb0(%arg5: vector<2xf16>):
      %5 = "gpu.subgroup_reduce"(%arg5) <{cluster_size = 4 : i32, cluster_stride = 1 : i32, op = #gpu<all_reduce_op add>}> : (vector<2xf16>) -> vector<2xf16>
      "test.consume"(%5) : (vector<2xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "kernel4_clustered", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (i16) -> ()}> ({
    ^bb0(%arg4: i16):
      %4 = "gpu.subgroup_reduce"(%arg4) <{cluster_stride = 1 : i32, op = #gpu<all_reduce_op add>}> : (i16) -> i16
      "test.consume"(%4) : (i16) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "kernel5", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (i16) -> ()}> ({
    ^bb0(%arg3: i16):
      %3 = "gpu.subgroup_reduce"(%arg3) <{cluster_size = 16 : i32, cluster_stride = 1 : i32, op = #gpu<all_reduce_op add>}> : (i16) -> i16
      "test.consume"(%3) : (i16) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "kernel5_clustered", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (vector<3xi8>) -> ()}> ({
    ^bb0(%arg2: vector<3xi8>):
      %2 = "gpu.subgroup_reduce"(%arg2) <{cluster_stride = 1 : i32, op = #gpu<all_reduce_op add>}> : (vector<3xi8>) -> vector<3xi8>
      "test.consume"(%2) : (vector<3xi8>) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "kernel6", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (f32) -> ()}> ({
    ^bb0(%arg1: f32):
      %1 = "gpu.subgroup_reduce"(%arg1) <{cluster_size = 32 : i32, cluster_stride = 1 : i32, op = #gpu<all_reduce_op add>}> : (f32) -> f32
      "test.consume"(%1) : (f32) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "kernel7", workgroup_attributions = 0 : i64} : () -> ()
    "gpu.func"() <{function_type = (vector<3xi8>) -> ()}> ({
    ^bb0(%arg0: vector<3xi8>):
      %0 = "gpu.subgroup_reduce"(%arg0) <{cluster_size = 32 : i32, cluster_stride = 1 : i32, op = #gpu<all_reduce_op add>}> : (vector<3xi8>) -> vector<3xi8>
      "test.consume"(%0) : (vector<3xi8>) -> ()
      "gpu.return"() : () -> ()
    }) {gpu.kernel, sym_name = "kernel_cluster_size_is_subgroup_size", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

