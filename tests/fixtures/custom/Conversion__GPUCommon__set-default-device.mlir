module attributes {gpu.container_module} {
  func.func @set_default_device(%arg0: i32) {
    gpu.set_default_device %arg0
    return
  }
}

