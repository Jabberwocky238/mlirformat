#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 8, crdWidth = 8 }>
module {
  func.func @kernel_matvec(%arg0: tensor<?x?xi32, #sparse>, %arg1: tensor<?xi32>, %arg2: tensor<?xi32>) -> tensor<?xi32> {
    %0 = linalg.generic {doc = "X(i) += A(i,j) * B(j)", indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?xi32, #sparse>, tensor<?xi32>) outs(%arg2 : tensor<?xi32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %1 = arith.muli %in, %in_0 : i32
      %2 = arith.addi %out, %1 : i32
      linalg.yield %2 : i32
    } -> tensor<?xi32>
    return %0 : tensor<?xi32>
  }
  func.func private @getTensorFilename(index) -> !llvm.ptr
  func.func @main() {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c256 = arith.constant 256 : index
    %0 = call @getTensorFilename(%c0) : (index) -> !llvm.ptr
    %1 = sparse_tensor.new %0 : !llvm.ptr to tensor<?x?xi32, #sparse>
    %generated = tensor.generate %c256 {
    ^bb0(%arg0: index):
      %4 = arith.addi %arg0, %c1 : index
      %5 = arith.index_cast %4 : index to i32
      tensor.yield %5 : i32
    } : tensor<?xi32>
    %generated_0 = tensor.generate %c4 {
    ^bb0(%arg0: index):
      tensor.yield %c0_i32 : i32
    } : tensor<?xi32>
    %2 = call @kernel_matvec(%1, %generated, %generated_0) : (tensor<?x?xi32, #sparse>, tensor<?xi32>, tensor<?xi32>) -> tensor<?xi32>
    %3 = vector.transfer_read %2[%c0], %c0_i32 : tensor<?xi32>, vector<4xi32>
    vector.print %3 : vector<4xi32>
    bufferization.dealloc_tensor %1 : tensor<?x?xi32, #sparse>
    bufferization.dealloc_tensor %generated : tensor<?xi32>
    bufferization.dealloc_tensor %2 : tensor<?xi32>
    return
  }
}

