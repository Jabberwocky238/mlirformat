#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, -d1 - 10)>
#map4 = affine_map<(d0, d1) -> (d0 floordiv 8, d1 floordiv 16, d0 mod 8, d1 mod 16)>
#map5 = affine_map<(d0, d1) -> (d0 * 2, d1 * 4)>
#map6 = affine_map<(d0, d1) -> (d0 * 3 + d1 * 17)>
#map7 = affine_map<(d0, d1)[s0] -> (d0 * 10 + d1)>
#map8 = affine_map<(d0, d1)[s0, s1] -> (d0 * s0 + d1 * s1)>
#map9 = affine_map<(d0) -> (d0 floordiv 4, d0 mod 4)>
#map10 = affine_map<(d0, d1)[s0] -> (d0 * 3 + s0 + d1)>
#map11 = affine_map<(d0, d1) -> (d0, d1 - 100)>
#map12 = affine_map<(d0, d1) -> (d0 * 4 + d1)>
#map13 = affine_map<(d0, d1) -> ((d0 mod 2) * 2 + d1 mod 2 + (d0 floordiv 2) * 4 + (d1 floordiv 2) * 8)>
#map14 = affine_map<(d0, d1) -> (d0 mod 2 + (d1 mod 2) * 2 + (d0 floordiv 2) * 8 + (d1 floordiv 2) * 4)>
module {
  func.func @permute() {
    %alloc = memref.alloc() : memref<64x256xf32, #map>
    affine.for %arg0 = 0 to 64 {
      affine.for %arg1 = 0 to 256 {
        %0 = affine.load %alloc[%arg0, %arg1] : memref<64x256xf32, #map>
        "prevent.dce"(%0) : (f32) -> ()
      }
    }
    memref.dealloc %alloc : memref<64x256xf32, #map>
    return
  }
  func.func @alloca(%arg0: index) {
    %alloca = memref.alloca() : memref<64xf32, #map1>
    %0 = affine.load %alloca[%arg0] : memref<64xf32, #map1>
    affine.for %arg1 = 0 to 64 {
      %1 = affine.load %alloca[%arg1] : memref<64xf32, #map1>
      "prevent.dce"(%1) : (f32) -> ()
    }
    return
  }
  func.func @shift(%arg0: index) {
    %alloc = memref.alloc() : memref<64xf32, #map1>
    %0 = affine.load %alloc[%arg0] : memref<64xf32, #map1>
    affine.for %arg1 = 0 to 64 {
      %1 = affine.load %alloc[%arg1] : memref<64xf32, #map1>
      "prevent.dce"(%1) : (f32) -> ()
    }
    return
  }
  func.func @high_dim_permute() {
    %alloc = memref.alloc() : memref<64x128x256xf32, #map2>
    affine.for %arg0 = 0 to 64 {
      affine.for %arg1 = 0 to 128 {
        affine.for %arg2 = 0 to 256 {
          %0 = affine.load %alloc[%arg0, %arg1, %arg2] : memref<64x128x256xf32, #map2>
          "prevent.dce"(%0) : (f32) -> ()
        }
      }
    }
    return
  }
  func.func @invalid_map() {
    %alloc = memref.alloc() : memref<64x128xf32, #map3>
    return
  }
  func.func @data_tiling(%arg0: index) {
    %alloc = memref.alloc() : memref<64x512xf32, #map4>
    %0 = affine.load %alloc[%arg0, %arg0] : memref<64x512xf32, #map4>
    "prevent.dce"(%0) : (f32) -> ()
    return
  }
  func.func @strided() {
    %alloc = memref.alloc() : memref<64x128xf32, #map5>
    affine.for %arg0 = 0 to 64 {
      affine.for %arg1 = 0 to 128 {
        %0 = affine.load %alloc[%arg0, %arg1] : memref<64x128xf32, #map5>
        "prevent.dce"(%0) : (f32) -> ()
      }
    }
    return
  }
  func.func @strided_cumulative() {
    %alloc = memref.alloc() : memref<2x5xf32, #map6>
    affine.for %arg0 = 0 to 2 {
      affine.for %arg1 = 0 to 5 {
        %0 = affine.load %alloc[%arg0, %arg1] : memref<2x5xf32, #map6>
        "prevent.dce"(%0) : (f32) -> ()
      }
    }
    return
  }
  func.func @symbolic_operands(%arg0: index) {
    %alloc = memref.alloc()[%arg0] : memref<10x10xf32, #map7>
    affine.for %arg1 = 0 to 10 {
      affine.for %arg2 = 0 to 10 {
        %0 = affine.load %alloc[%arg1, %arg2] : memref<10x10xf32, #map7>
        "prevent.dce"(%0) : (f32) -> ()
      }
    }
    return
  }
  func.func @semi_affine_layout_map(%arg0: index, %arg1: index) {
    %alloc = memref.alloc()[%arg0, %arg1] : memref<256x1024xf32, #map8>
    affine.for %arg2 = 0 to 256 {
      affine.for %arg3 = 0 to 1024 {
        %0 = affine.load %alloc[%arg2, %arg3] : memref<256x1024xf32, #map8>
      }
    }
    return
  }
  func.func @alignment() {
    %alloc = memref.alloc() {alignment = 32 : i64} : memref<64x128x256xf32, #map2>
    return
  }
  func.func @multiple_argument_type(%arg0: memref<16xf64, #map9>, %arg1: f64, %arg2: memref<8xf64, #map9>, %arg3: memref<24xf64>) -> f64 {
    %0 = affine.load %arg0[0] : memref<16xf64, #map9>
    %1 = arith.mulf %0, %0 : f64
    affine.store %1, %arg0[10] : memref<16xf64, #map9>
    call @single_argument_type(%arg2) : (memref<8xf64, #map9>) -> ()
    return %arg1 : f64
  }
  func.func @single_argument_type(%arg0: memref<8xf64, #map9>) {
    %alloc = memref.alloc() : memref<8xf64, #map9>
    %alloc_0 = memref.alloc() : memref<16xf64, #map9>
    %cst = arith.constant 2.300000e+01 : f64
    %alloc_1 = memref.alloc() : memref<24xf64>
    call @single_argument_type(%alloc) : (memref<8xf64, #map9>) -> ()
    call @single_argument_type(%arg0) : (memref<8xf64, #map9>) -> ()
    %0 = call @multiple_argument_type(%alloc_0, %cst, %alloc, %alloc_1) : (memref<16xf64, #map9>, f64, memref<8xf64, #map9>, memref<24xf64>) -> f64
    return
  }
  func.func @non_memref_ret(%arg0: memref<8xf64, #map9>) -> i1 {
    %true = arith.constant true
    return %true : i1
  }
  func.func @ret_multiple_argument_type(%arg0: memref<16xf64, #map9>, %arg1: f64, %arg2: memref<8xf64, #map9>) -> (memref<8xf64, #map9>, f64) {
    %0 = affine.load %arg0[0] : memref<16xf64, #map9>
    %1 = arith.mulf %0, %0 : f64
    %true = arith.constant true
    cf.cond_br %true, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %2:2 = call @ret_single_argument_type(%arg2) : (memref<8xf64, #map9>) -> (memref<16xf64, #map9>, memref<8xf64, #map9>)
    return %2#1, %1 : memref<8xf64, #map9>, f64
  ^bb2:  // pred: ^bb0
    return %arg2, %1 : memref<8xf64, #map9>, f64
  }
  func.func @ret_single_argument_type(%arg0: memref<8xf64, #map9>) -> (memref<16xf64, #map9>, memref<8xf64, #map9>) {
    %alloc = memref.alloc() : memref<8xf64, #map9>
    %alloc_0 = memref.alloc() : memref<16xf64, #map9>
    %cst = arith.constant 2.300000e+01 : f64
    %0:2 = call @ret_single_argument_type(%alloc) : (memref<8xf64, #map9>) -> (memref<16xf64, #map9>, memref<8xf64, #map9>)
    %1:2 = call @ret_single_argument_type(%arg0) : (memref<8xf64, #map9>) -> (memref<16xf64, #map9>, memref<8xf64, #map9>)
    %2:2 = call @ret_multiple_argument_type(%alloc_0, %cst, %alloc) : (memref<16xf64, #map9>, f64, memref<8xf64, #map9>) -> (memref<8xf64, #map9>, f64)
    %3:2 = call @ret_single_argument_type(%2#0) : (memref<8xf64, #map9>) -> (memref<16xf64, #map9>, memref<8xf64, #map9>)
    return %alloc_0, %alloc : memref<16xf64, #map9>, memref<8xf64, #map9>
  }
  func.func @func_A(%arg0: memref<8xf64, #map9>) {
    call @func_B(%arg0) : (memref<8xf64, #map9>) -> ()
    return
  }
  func.func @func_B(%arg0: memref<8xf64, #map9>) {
    call @func_C(%arg0) : (memref<8xf64, #map9>) -> ()
    return
  }
  func.func @func_C(%arg0: memref<8xf64, #map9>) {
    return
  }
  func.func @some_func_A(%arg0: memref<8xf64, #map9>) {
    call @some_func_B(%arg0) : (memref<8xf64, #map9>) -> ()
    return
  }
  func.func @some_func_B(%arg0: memref<8xf64, #map9>) {
    "test.test"(%arg0) : (memref<8xf64, #map9>) -> ()
    call @some_func_C(%arg0) : (memref<8xf64, #map9>) -> ()
    return
  }
  func.func @some_func_C(%arg0: memref<8xf64, #map9>) {
    return
  }
  func.func private @external_func_A(memref<16xf64, #map9>)
  func.func private @external_func_B(memref<16xf64, #map9>, f64) -> memref<8xf64, #map9>
  func.func @simply_call_external() {
    %alloc = memref.alloc() : memref<16xf64, #map9>
    call @external_func_A(%alloc) : (memref<16xf64, #map9>) -> ()
    return
  }
  func.func @use_value_of_external(%arg0: memref<16xf64, #map9>, %arg1: f64) -> memref<8xf64, #map9> {
    %0 = call @external_func_B(%arg0, %arg1) : (memref<16xf64, #map9>, f64) -> memref<8xf64, #map9>
    return %0 : memref<8xf64, #map9>
  }
  func.func @affine_parallel_norm() -> memref<8xf32, #map9> {
    %cst = arith.constant 2.300000e+01 : f32
    %alloc = memref.alloc() : memref<8xf32, #map9>
    %0 = affine.parallel (%arg0) = (0) to (8) reduce ("assign") -> (memref<8xf32, #map9>) {
      affine.store %cst, %alloc[%arg0] : memref<8xf32, #map9>
      affine.yield %alloc : memref<8xf32, #map9>
    }
    return %0 : memref<8xf32, #map9>
  }
  func.func @map_symbol() -> memref<2x3xf32, #map10> {
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc()[%c1] : memref<2x3xf32, #map10>
    return %alloc : memref<2x3xf32, #map10>
  }
  func.func @neg_map() -> memref<2x3xf32, #map11> {
    %alloc = memref.alloc() : memref<2x3xf32, #map11>
    return %alloc : memref<2x3xf32, #map11>
  }
  func.func @memref_with_strided_offset(%arg0: tensor<128x512xf32>, %arg1: index, %arg2: index) -> tensor<16x512xf32> {
    %c0 = arith.constant 0 : index
    %0 = bufferization.to_buffer %arg0 : tensor<128x512xf32> to memref<128x512xf32, strided<[?, ?], offset: ?>>
    %subview = memref.subview %0[%arg2, 0] [%arg1, 512] [1, 1] : memref<128x512xf32, strided<[?, ?], offset: ?>> to memref<?x512xf32, strided<[?, ?], offset: ?>>
    %cast = memref.cast %subview : memref<?x512xf32, strided<[?, ?], offset: ?>> to memref<16x512xf32, strided<[?, ?], offset: ?>>
    %1 = bufferization.to_tensor %cast : memref<16x512xf32, strided<[?, ?], offset: ?>> to tensor<16x512xf32>
    return %1 : tensor<16x512xf32>
  }
  func.func @memref_load_with_reduction_map(%arg0: memref<4x4xf32, #map12>) {
    %alloc = memref.alloc() : memref<4x8xf32, #map13>
    %alloc_0 = memref.alloc() : memref<8x4xf32, #map14>
    %alloc_1 = memref.alloc() : memref<4x4xf32, #map12>
    %cst = arith.constant 3.000000e+00 : f32
    %c0 = arith.constant 0 : index
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 8 {
        affine.for %arg3 = 0 to 8 {
          %0 = memref.load %alloc[%arg1, %arg3] : memref<4x8xf32, #map13>
          %1 = memref.load %alloc_0[%arg3, %arg2] : memref<8x4xf32, #map14>
          %2 = memref.load %alloc_1[%arg1, %arg2] : memref<4x4xf32, #map12>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %3, %2 : f32
          affine.store %4, %arg0[%arg1, %arg2] : memref<4x4xf32, #map12>
        }
      }
    }
    return
  }
}

