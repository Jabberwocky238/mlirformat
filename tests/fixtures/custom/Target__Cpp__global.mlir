module {
  emitc.global extern @decl : i8
  emitc.global @uninit : i32
  emitc.global @myglobal_int : i32 = 4
  emitc.global @myglobal : !emitc.array<2xf32> = dense<4.000000e+00>
  emitc.global const @myconstant : !emitc.array<2xi16> = dense<2>
  emitc.global const @myconstant_2d : !emitc.array<2x3xi16> = dense<1>
  emitc.global extern const @extern_constant : !emitc.array<2xi16>
  emitc.global static @static_var : f32
  emitc.global static const @static_const : f32 = 3.000000e+00
  emitc.global @opaque_init : !emitc.opaque<"char"> = #emitc.opaque<"CHAR_MIN">
  func.func @use_global_scalar_read() -> i32 {
    %0 = emitc.get_global @myglobal_int : !emitc.lvalue<i32>
    %1 = emitc.load %0 : <i32>
    return %1 : i32
  }
  func.func @use_global_scalar_write(%arg0: i32) {
    %0 = emitc.get_global @myglobal_int : !emitc.lvalue<i32>
    emitc.assign %arg0 : i32 to %0 : <i32>
    return
  }
  func.func @use_global_array_read(%arg0: index) -> f32 {
    %0 = emitc.get_global @myglobal : !emitc.array<2xf32>
    %1 = emitc.subscript %0[%arg0] : (!emitc.array<2xf32>, index) -> !emitc.lvalue<f32>
    %2 = emitc.load %1 : <f32>
    return %2 : f32
  }
  func.func @use_global_array_write(%arg0: index, %arg1: f32) {
    %0 = emitc.get_global @myglobal : !emitc.array<2xf32>
    %1 = emitc.subscript %0[%arg0] : (!emitc.array<2xf32>, index) -> !emitc.lvalue<f32>
    emitc.assign %arg1 : f32 to %1 : <f32>
    return
  }
  func.func @use_const_global_array_pointer_address_of(%arg0: index) -> !emitc.ptr<i16> {
    %0 = emitc.get_global @myconstant : !emitc.array<2xi16>
    %1 = emitc.subscript %0[%arg0] : (!emitc.array<2xi16>, index) -> !emitc.lvalue<i16>
    %2 = emitc.address_of %1 : !emitc.lvalue<i16>
    return %2 : !emitc.ptr<i16>
  }
  func.func @use_const_global_scalar_pointer_address_of() -> !emitc.ptr<f32> {
    %0 = emitc.get_global @static_const : !emitc.lvalue<f32>
    %1 = emitc.address_of %0 : !emitc.lvalue<f32>
    return %1 : !emitc.ptr<f32>
  }
  func.func @use_const_global_2d_array_pointer_address_of(%arg0: index, %arg1: index) -> !emitc.ptr<i16> {
    %0 = emitc.get_global @myconstant_2d : !emitc.array<2x3xi16>
    %1 = emitc.subscript %0[%arg0, %arg1] : (!emitc.array<2x3xi16>, index, index) -> !emitc.lvalue<i16>
    %2 = emitc.address_of %1 : !emitc.lvalue<i16>
    return %2 : !emitc.ptr<i16>
  }
}

