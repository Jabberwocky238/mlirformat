module {
  gpu.module @random_container {
    func.func @nested(%arg0: tensor<1xi8>) -> tensor<1xi8> {
      return %arg0 : tensor<1xi8>
    }
  }
}

// -----
module @random_container {
  module @yet_anther_random_container {
    gpu.module @another_random_container {
      func.func @nested(%arg0: tensor<1xi8>) -> tensor<1xi8> {
        return %arg0 : tensor<1xi8>
      }
    }
  }
}

