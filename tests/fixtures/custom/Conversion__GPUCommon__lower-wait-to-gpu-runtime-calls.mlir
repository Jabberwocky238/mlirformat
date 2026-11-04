module attributes {gpu.container_module} {
  func.func @foo() {
    %0 = gpu.wait async
    %1 = gpu.wait async [%0]
    gpu.wait [%0, %1]
    return
  }
}

