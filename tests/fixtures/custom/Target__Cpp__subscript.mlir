module {
  func.func @load_store_array(%arg0: !emitc.array<4x8xf32>, %arg1: !emitc.array<3x5xf32>, %arg2: index, %arg3: index) {
    %0 = emitc.subscript %arg0[%arg2, %arg3] : (!emitc.array<4x8xf32>, index, index) -> !emitc.lvalue<f32>
    %1 = emitc.subscript %arg1[%arg2, %arg3] : (!emitc.array<3x5xf32>, index, index) -> !emitc.lvalue<f32>
    %2 = emitc.load %0 : <f32>
    emitc.assign %2 : f32 to %1 : <f32>
    return
  }
  func.func @load_store_pointer(%arg0: !emitc.ptr<f32>, %arg1: !emitc.ptr<f32>, %arg2: index, %arg3: index) {
    %0 = emitc.subscript %arg0[%arg2] : (!emitc.ptr<f32>, index) -> !emitc.lvalue<f32>
    %1 = emitc.subscript %arg1[%arg3] : (!emitc.ptr<f32>, index) -> !emitc.lvalue<f32>
    %2 = emitc.load %0 : <f32>
    emitc.assign %2 : f32 to %1 : <f32>
    return
  }
  func.func @load_store_opaque(%arg0: !emitc.opaque<"std::map<char, int>">, %arg1: !emitc.opaque<"std::map<char, int>">, %arg2: !emitc.opaque<"char">, %arg3: !emitc.opaque<"char">) {
    %0 = emitc.subscript %arg0[%arg2] : (!emitc.opaque<"std::map<char, int>">, !emitc.opaque<"char">) -> !emitc.lvalue<!emitc.opaque<"int">>
    %1 = emitc.subscript %arg1[%arg3] : (!emitc.opaque<"std::map<char, int>">, !emitc.opaque<"char">) -> !emitc.lvalue<!emitc.opaque<"int">>
    %2 = emitc.load %0 : <!emitc.opaque<"int">>
    emitc.assign %2 : !emitc.opaque<"int"> to %1 : <!emitc.opaque<"int">>
    return
  }
  emitc.func @func1(%arg0: f32) {
    return
  }
  emitc.func @call_arg(%arg0: !emitc.array<4x8xf32>, %arg1: i32, %arg2: i16, %arg3: i8) {
    %0 = subscript %arg0[%arg1, %arg2] : (!emitc.array<4x8xf32>, i32, i16) -> !emitc.lvalue<f32>
    %1 = subscript %arg0[%arg2, %arg3] : (!emitc.array<4x8xf32>, i16, i8) -> !emitc.lvalue<f32>
    %2 = load %0 : <f32>
    call @func1(%2) : (f32) -> ()
    %3 = load %1 : <f32>
    call_opaque "func2"(%3) : (f32) -> ()
    %4 = load %0 : <f32>
    %5 = load %1 : <f32>
    call_opaque "func3"(%4, %5) {args = [1 : index, 0 : index]} : (f32, f32) -> ()
    return
  }
}

