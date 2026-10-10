module {
  gpu.module @kernels {
    gpu.func @kernel0(%arg0: vector<5xf16>) kernel {
      %0 = gpu.subgroup_reduce  add %arg0 : (vector<5xf16>) -> vector<5xf16>
      "test.consume"(%0) : (vector<5xf16>) -> ()
      %1 = gpu.subgroup_reduce  mul %arg0 uniform : (vector<5xf16>) -> vector<5xf16>
      "test.consume"(%1) : (vector<5xf16>) -> ()
      %2 = gpu.subgroup_reduce  mul %arg0 cluster(size = 4) : (vector<5xf16>) -> vector<5xf16>
      "test.consume"(%2) : (vector<5xf16>) -> ()
      %3 = gpu.subgroup_reduce  mul %arg0 uniform cluster(size = 4, stride = 2) : (vector<5xf16>) -> vector<5xf16>
      "test.consume"(%3) : (vector<5xf16>) -> ()
      gpu.return
    }
    gpu.func @kernel1(%arg0: vector<1xf32>) kernel {
      %0 = gpu.subgroup_reduce  add %arg0 : (vector<1xf32>) -> vector<1xf32>
      "test.consume"(%0) : (vector<1xf32>) -> ()
      %1 = gpu.subgroup_reduce  add %arg0 uniform : (vector<1xf32>) -> vector<1xf32>
      "test.consume"(%1) : (vector<1xf32>) -> ()
      %2 = gpu.subgroup_reduce  add %arg0 cluster(size = 8) : (vector<1xf32>) -> vector<1xf32>
      "test.consume"(%2) : (vector<1xf32>) -> ()
      %3 = gpu.subgroup_reduce  add %arg0 uniform cluster(size = 8, stride = 4) : (vector<1xf32>) -> vector<1xf32>
      "test.consume"(%3) : (vector<1xf32>) -> ()
      gpu.return
    }
    gpu.func @kernel2(%arg0: vector<3xi8>, %arg1: vector<4xi8>) kernel {
      %0 = gpu.subgroup_reduce  add %arg0 : (vector<3xi8>) -> vector<3xi8>
      "test.consume"(%0) : (vector<3xi8>) -> ()
      %1 = gpu.subgroup_reduce  add %arg1 : (vector<4xi8>) -> vector<4xi8>
      "test.consume"(%1) : (vector<4xi8>) -> ()
      gpu.return
    }
    gpu.func @kernel3(%arg0: i32) kernel {
      %0 = gpu.subgroup_reduce  add %arg0 : (i32) -> i32
      "test.consume"(%0) : (i32) -> ()
      gpu.return
    }
    gpu.func @kernel3_clustered(%arg0: i32) kernel {
      %0 = gpu.subgroup_reduce  add %arg0 cluster(size = 8) : (i32) -> i32
      "test.consume"(%0) : (i32) -> ()
      gpu.return
    }
    gpu.func @kernel3_clustered_strided(%arg0: i32) kernel {
      %0 = gpu.subgroup_reduce  add %arg0 cluster(size = 8, stride = 4) : (i32) -> i32
      "test.consume"(%0) : (i32) -> ()
      gpu.return
    }
    gpu.func @kernel4(%arg0: vector<2xf16>) kernel {
      %0 = gpu.subgroup_reduce  add %arg0 : (vector<2xf16>) -> vector<2xf16>
      "test.consume"(%0) : (vector<2xf16>) -> ()
      gpu.return
    }
    gpu.func @kernel4_clustered(%arg0: vector<2xf16>) kernel {
      %0 = gpu.subgroup_reduce  add %arg0 cluster(size = 4) : (vector<2xf16>) -> vector<2xf16>
      "test.consume"(%0) : (vector<2xf16>) -> ()
      gpu.return
    }
    gpu.func @kernel5(%arg0: i16) kernel {
      %0 = gpu.subgroup_reduce  add %arg0 : (i16) -> i16
      "test.consume"(%0) : (i16) -> ()
      gpu.return
    }
    gpu.func @kernel5_clustered(%arg0: i16) kernel {
      %0 = gpu.subgroup_reduce  add %arg0 cluster(size = 16) : (i16) -> i16
      "test.consume"(%0) : (i16) -> ()
      gpu.return
    }
    gpu.func @kernel6(%arg0: vector<3xi8>) kernel {
      %0 = gpu.subgroup_reduce  add %arg0 : (vector<3xi8>) -> vector<3xi8>
      "test.consume"(%0) : (vector<3xi8>) -> ()
      gpu.return
    }
    gpu.func @kernel7(%arg0: f32) kernel {
      %0 = gpu.subgroup_reduce  add %arg0 cluster(size = 32) : (f32) -> f32
      "test.consume"(%0) : (f32) -> ()
      gpu.return
    }
    gpu.func @kernel_cluster_size_is_subgroup_size(%arg0: vector<3xi8>) kernel {
      %0 = gpu.subgroup_reduce  add %arg0 cluster(size = 32) : (vector<3xi8>) -> vector<3xi8>
      "test.consume"(%0) : (vector<3xi8>) -> ()
      gpu.return
    }
  }
}

