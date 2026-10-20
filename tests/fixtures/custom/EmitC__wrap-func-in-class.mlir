module {
  emitc.func @foo(%arg0: !emitc.array<1xf32>) {
    call_opaque "bar"(%arg0) : (!emitc.array<1xf32>) -> ()
    return
  }
}

// -----
module {
  emitc.func @model(%arg0: !emitc.array<1xf32> {emitc.name_hint = "another_feature"}, %arg1: !emitc.array<1xf32> {emitc.name_hint = "some_feature"}, %arg2: !emitc.array<1xf32> {emitc.name_hint = "output_0"}) {
    %0 = "emitc.constant"() <{value = 0 : index}> : () -> !emitc.size_t
    %1 = subscript %arg1[%0] : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32>
    %2 = load %1 : <f32>
    %3 = subscript %arg0[%0] : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32>
    %4 = load %3 : <f32>
    %5 = add %2, %4 : (f32, f32) -> f32
    %6 = subscript %arg2[%0] : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32>
    assign %5 : f32 to %6 : <f32>
    return
  }
}

