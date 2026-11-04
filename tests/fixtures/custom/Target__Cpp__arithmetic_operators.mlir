module {
  func.func @add_int(%arg0: i32, %arg1: i32) {
    %0 = emitc.add %arg0, %arg1 : (i32, i32) -> i32
    return
  }
  func.func @add_pointer(%arg0: !emitc.ptr<f32>, %arg1: i32) {
    %0 = emitc.add %arg0, %arg1 : (!emitc.ptr<f32>, i32) -> !emitc.ptr<f32>
    return
  }
  func.func @div_int(%arg0: i32, %arg1: i32) {
    %0 = emitc.div %arg0, %arg1 : (i32, i32) -> i32
    return
  }
  func.func @mul_int(%arg0: i32, %arg1: i32) {
    %0 = emitc.mul %arg0, %arg1 : (i32, i32) -> i32
    return
  }
  func.func @rem(%arg0: i32, %arg1: i32) {
    %0 = emitc.rem %arg0, %arg1 : (i32, i32) -> i32
    return
  }
  func.func @sub_int(%arg0: i32, %arg1: i32) {
    %0 = emitc.sub %arg0, %arg1 : (i32, i32) -> i32
    return
  }
  func.func @sub_pointer(%arg0: !emitc.ptr<f32>, %arg1: !emitc.ptr<f32>) {
    %0 = emitc.sub %arg0, %arg1 : (!emitc.ptr<f32>, !emitc.ptr<f32>) -> !emitc.opaque<"ptrdiff_t">
    return
  }
}

