#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @add(%arg0: tensor<32xi64, #sparse>, %arg1: tensor<32xi64>, %arg2: tensor<32xi64>) -> tensor<32xi64> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xi64, #sparse>, tensor<32xi64>) outs(%arg2 : tensor<32xi64>) {
    ^bb0(%in: i64, %in_0: i64, %out: i64):
      %1 = arith.addi %in, %in_0 : i64
      linalg.yield %1 : i64
    } -> tensor<32xi64>
    return %0 : tensor<32xi64>
  }
  func.func @sub(%arg0: tensor<32xi64, #sparse>, %arg1: tensor<32xi64>, %arg2: tensor<32xi64>) -> tensor<32xi64> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xi64, #sparse>, tensor<32xi64>) outs(%arg2 : tensor<32xi64>) {
    ^bb0(%in: i64, %in_0: i64, %out: i64):
      %1 = arith.subi %in, %in_0 : i64
      linalg.yield %1 : i64
    } -> tensor<32xi64>
    return %0 : tensor<32xi64>
  }
  func.func @mul(%arg0: tensor<32xi64, #sparse>, %arg1: tensor<32xi64>, %arg2: tensor<32xi64>) -> tensor<32xi64> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xi64, #sparse>, tensor<32xi64>) outs(%arg2 : tensor<32xi64>) {
    ^bb0(%in: i64, %in_0: i64, %out: i64):
      %1 = arith.muli %in, %in_0 : i64
      linalg.yield %1 : i64
    } -> tensor<32xi64>
    return %0 : tensor<32xi64>
  }
  func.func @divsbyc(%arg0: tensor<32xi64, #sparse>, %arg1: tensor<32xi64>) -> tensor<32xi64> {
    %c2_i64 = arith.constant 2 : i64
    %0 = linalg.generic {doc = "x(i) = a(i) OP c", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<32xi64, #sparse>) outs(%arg1 : tensor<32xi64>) {
    ^bb0(%in: i64, %out: i64):
      %1 = arith.divsi %in, %c2_i64 : i64
      linalg.yield %1 : i64
    } -> tensor<32xi64>
    return %0 : tensor<32xi64>
  }
  func.func @divubyc(%arg0: tensor<32xi64, #sparse>, %arg1: tensor<32xi64>) -> tensor<32xi64> {
    %c2_i64 = arith.constant 2 : i64
    %0 = linalg.generic {doc = "x(i) = a(i) OP c", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<32xi64, #sparse>) outs(%arg1 : tensor<32xi64>) {
    ^bb0(%in: i64, %out: i64):
      %1 = arith.divui %in, %c2_i64 : i64
      linalg.yield %1 : i64
    } -> tensor<32xi64>
    return %0 : tensor<32xi64>
  }
  func.func @and(%arg0: tensor<32xi64, #sparse>, %arg1: tensor<32xi64>, %arg2: tensor<32xi64>) -> tensor<32xi64> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xi64, #sparse>, tensor<32xi64>) outs(%arg2 : tensor<32xi64>) {
    ^bb0(%in: i64, %in_0: i64, %out: i64):
      %1 = arith.andi %in, %in_0 : i64
      linalg.yield %1 : i64
    } -> tensor<32xi64>
    return %0 : tensor<32xi64>
  }
  func.func @or(%arg0: tensor<32xi64, #sparse>, %arg1: tensor<32xi64>, %arg2: tensor<32xi64>) -> tensor<32xi64> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xi64, #sparse>, tensor<32xi64>) outs(%arg2 : tensor<32xi64>) {
    ^bb0(%in: i64, %in_0: i64, %out: i64):
      %1 = arith.ori %in, %in_0 : i64
      linalg.yield %1 : i64
    } -> tensor<32xi64>
    return %0 : tensor<32xi64>
  }
  func.func @xor(%arg0: tensor<32xi64, #sparse>, %arg1: tensor<32xi64>, %arg2: tensor<32xi64>) -> tensor<32xi64> {
    %0 = linalg.generic {doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xi64, #sparse>, tensor<32xi64>) outs(%arg2 : tensor<32xi64>) {
    ^bb0(%in: i64, %in_0: i64, %out: i64):
      %1 = arith.xori %in, %in_0 : i64
      linalg.yield %1 : i64
    } -> tensor<32xi64>
    return %0 : tensor<32xi64>
  }
  func.func @ashrbyc(%arg0: tensor<32xi64, #sparse>, %arg1: tensor<32xi64>) -> tensor<32xi64> {
    %c2_i64 = arith.constant 2 : i64
    %0 = linalg.generic {doc = "x(i) = a(i) OP c", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<32xi64, #sparse>) outs(%arg1 : tensor<32xi64>) {
    ^bb0(%in: i64, %out: i64):
      %1 = arith.shrsi %in, %c2_i64 : i64
      linalg.yield %1 : i64
    } -> tensor<32xi64>
    return %0 : tensor<32xi64>
  }
  func.func @lsrbyc(%arg0: tensor<32xi64, #sparse>, %arg1: tensor<32xi64>) -> tensor<32xi64> {
    %c2_i64 = arith.constant 2 : i64
    %0 = linalg.generic {doc = "x(i) = a(i) OP c", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<32xi64, #sparse>) outs(%arg1 : tensor<32xi64>) {
    ^bb0(%in: i64, %out: i64):
      %1 = arith.shrui %in, %c2_i64 : i64
      linalg.yield %1 : i64
    } -> tensor<32xi64>
    return %0 : tensor<32xi64>
  }
  func.func @lslbyc(%arg0: tensor<32xi64, #sparse>, %arg1: tensor<32xi64>) -> tensor<32xi64> {
    %c2_i64 = arith.constant 2 : i64
    %0 = linalg.generic {doc = "x(i) = a(i) OP c", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<32xi64, #sparse>) outs(%arg1 : tensor<32xi64>) {
    ^bb0(%in: i64, %out: i64):
      %1 = arith.shli %in, %c2_i64 : i64
      linalg.yield %1 : i64
    } -> tensor<32xi64>
    return %0 : tensor<32xi64>
  }
}

