#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @for(%arg0: tensor<1024xf32, #sparse>, %arg1: index, %arg2: index, %arg3: index) -> tensor<1024xf32, #sparse> {
    %0 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %arg0) -> (tensor<1024xf32, #sparse>) {
      scf.yield %arg5 : tensor<1024xf32, #sparse>
    }
    return %0 : tensor<1024xf32, #sparse>
  }
  func.func @if(%arg0: tensor<1024xf32, #sparse>, %arg1: tensor<1024xf32, #sparse>, %arg2: i1) -> tensor<1024xf32, #sparse> {
    %0 = scf.if %arg2 -> (tensor<1024xf32, #sparse>) {
      scf.yield %arg0 : tensor<1024xf32, #sparse>
    } else {
      scf.yield %arg1 : tensor<1024xf32, #sparse>
    }
    return %0 : tensor<1024xf32, #sparse>
  }
  func.func @while(%arg0: tensor<1024xf32, #sparse>, %arg1: i1) -> tensor<1024xf32, #sparse> {
    %0 = scf.while (%arg2 = %arg0) : (tensor<1024xf32, #sparse>) -> tensor<1024xf32, #sparse> {
      scf.condition(%arg1) %arg2 : tensor<1024xf32, #sparse>
    } do {
    ^bb0(%arg2: tensor<1024xf32, #sparse>):
      scf.yield %arg2 : tensor<1024xf32, #sparse>
    }
    return %0 : tensor<1024xf32, #sparse>
  }
  func.func @index_switch(%arg0: index, %arg1: tensor<5xf32, #sparse>, %arg2: tensor<5xf32, #sparse>, %arg3: tensor<5xf32, #sparse>) -> tensor<5xf32, #sparse> {
    %0 = scf.index_switch %arg0 -> tensor<5xf32, #sparse> 
    case 1 {
      scf.yield %arg1 : tensor<5xf32, #sparse>
    }
    case 2 {
      scf.yield %arg2 : tensor<5xf32, #sparse>
    }
    default {
      scf.yield %arg3 : tensor<5xf32, #sparse>
    }
    return %0 : tensor<5xf32, #sparse>
  }
}

