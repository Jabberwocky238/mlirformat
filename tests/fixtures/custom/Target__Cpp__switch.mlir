module {
  func.func @emitc_switch_ptrdiff_t() {
    %0 = "emitc.constant"() <{value = 1 : index}> : () -> !emitc.ptrdiff_t
    emitc.switch %0 : !emitc.ptrdiff_t 
    case 2 {
      %1 = call_opaque "func_b"() : () -> i32
      yield
    }
    case 5 {
      %1 = call_opaque "func_a"() : () -> i32
      yield
    }
    default {
      %1 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      call_opaque "func2"(%1) : (f32) -> ()
    }
    return
  }
  func.func @emitc_switch_ssize_t() {
    %0 = "emitc.constant"() <{value = 1 : index}> : () -> !emitc.ssize_t
    emitc.switch %0 : !emitc.ssize_t 
    case 2 {
      %1 = call_opaque "func_b"() : () -> i32
      yield
    }
    case 5 {
      %1 = call_opaque "func_a"() : () -> i32
      yield
    }
    default {
      %1 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      call_opaque "func2"(%1) : (f32) -> ()
    }
    return
  }
  func.func @emitc_switch_size_t() {
    %0 = "emitc.constant"() <{value = 1 : index}> : () -> !emitc.size_t
    emitc.switch %0 : !emitc.size_t 
    case 2 {
      %1 = call_opaque "func_b"() : () -> i32
      yield
    }
    case 5 {
      %1 = call_opaque "func_a"() : () -> i32
      yield
    }
    default {
      %1 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      call_opaque "func2"(%1) : (f32) -> ()
    }
    return
  }
  func.func @emitc_switch_index() {
    %0 = "emitc.constant"() <{value = 1 : index}> : () -> index
    emitc.switch %0 : index 
    case 2 {
      %1 = call_opaque "func_b"() : () -> i32
      yield
    }
    case 5 {
      %1 = call_opaque "func_a"() : () -> i32
      yield
    }
    default {
      %1 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      call_opaque "func2"(%1) : (f32) -> ()
    }
    return
  }
  func.func @emitc_switch_opaque() {
    %0 = "emitc.constant"() <{value = #emitc.opaque<"1">}> : () -> !emitc.opaque<"size_t">
    emitc.switch %0 : !emitc.opaque<"size_t"> 
    case 2 {
      %1 = call_opaque "func_b"() : () -> i32
      yield
    }
    case 5 {
      %1 = call_opaque "func_a"() : () -> i32
      yield
    }
    default {
      %1 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      call_opaque "func2"(%1) : (f32) -> ()
    }
    return
  }
  func.func @emitc_switch_i1() {
    %0 = "emitc.constant"() <{value = true}> : () -> i1
    emitc.switch %0 : i1 
    case 2 {
      %1 = call_opaque "func_b"() : () -> i32
      yield
    }
    case 5 {
      %1 = call_opaque "func_a"() : () -> i32
      yield
    }
    default {
      %1 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      call_opaque "func2"(%1) : (f32) -> ()
    }
    return
  }
  func.func @emitc_switch_i8() {
    %0 = "emitc.constant"() <{value = 1 : i8}> : () -> i8
    emitc.switch %0 : i8 
    case 2 {
      %1 = call_opaque "func_b"() : () -> i32
      yield
    }
    case 5 {
      %1 = call_opaque "func_a"() : () -> i32
      yield
    }
    default {
      %1 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      call_opaque "func2"(%1) : (f32) -> ()
    }
    return
  }
  func.func @emitc_switch_ui8() {
    %0 = "emitc.constant"() <{value = 1 : ui8}> : () -> ui8
    emitc.switch %0 : ui8 
    case 2 {
      %1 = call_opaque "func_b"() : () -> i32
      yield
    }
    case 5 {
      %1 = call_opaque "func_a"() : () -> i32
      yield
    }
    default {
      %1 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      call_opaque "func2"(%1) : (f32) -> ()
    }
    return
  }
  func.func @emitc_switch_i16() {
    %0 = "emitc.constant"() <{value = 1 : i16}> : () -> i16
    emitc.switch %0 : i16 
    case 2 {
      %1 = call_opaque "func_b"() : () -> i32
      yield
    }
    case 5 {
      %1 = call_opaque "func_a"() : () -> i32
      yield
    }
    default {
      %1 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      call_opaque "func2"(%1) : (f32) -> ()
    }
    return
  }
  func.func @emitc_switch_ui16() {
    %0 = "emitc.constant"() <{value = 1 : ui16}> : () -> ui16
    emitc.switch %0 : ui16 
    case 2 {
      %1 = call_opaque "func_b"() : () -> i32
      yield
    }
    case 5 {
      %1 = call_opaque "func_a"() : () -> i32
      yield
    }
    default {
      %1 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      call_opaque "func2"(%1) : (f32) -> ()
    }
    return
  }
  func.func @emitc_switch_i32() {
    %0 = "emitc.constant"() <{value = 1 : i32}> : () -> i32
    emitc.switch %0 : i32 
    case 2 {
      %1 = call_opaque "func_b"() : () -> i32
      yield
    }
    case 5 {
      %1 = call_opaque "func_a"() : () -> i32
      yield
    }
    default {
      %1 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      call_opaque "func2"(%1) : (f32) -> ()
    }
    return
  }
  func.func @emitc_switch_ui32() {
    %0 = "emitc.constant"() <{value = 1 : ui32}> : () -> ui32
    emitc.switch %0 : ui32 
    case 2 {
      %1 = call_opaque "func_b"() : () -> i32
      yield
    }
    case 5 {
      %1 = call_opaque "func_a"() : () -> i32
      yield
    }
    default {
      %1 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      call_opaque "func2"(%1) : (f32) -> ()
    }
    return
  }
  func.func @emitc_switch_i64() {
    %0 = "emitc.constant"() <{value = 1 : i64}> : () -> i64
    emitc.switch %0 : i64 
    case 2 {
      %1 = call_opaque "func_b"() : () -> i32
      yield
    }
    case 5 {
      %1 = call_opaque "func_a"() : () -> i32
      yield
    }
    default {
      %1 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      call_opaque "func2"(%1) : (f32) -> ()
    }
    return
  }
  func.func @emitc_switch_ui64() {
    %0 = "emitc.constant"() <{value = 1 : ui64}> : () -> ui64
    emitc.switch %0 : ui64 
    case 2 {
      %1 = call_opaque "func_b"() : () -> i32
      yield
    }
    case 5 {
      %1 = call_opaque "func_a"() : () -> i32
      yield
    }
    default {
      %1 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      call_opaque "func2"(%1) : (f32) -> ()
    }
    return
  }
  func.func @emitc_switch_expression() {
    %0 = "emitc.constant"() <{value = 42 : i64}> : () -> i64
    %1 = emitc.expression %0 : (i64) -> i64 {
      %2 = unary_minus %0 : (i64) -> i64
      yield %2 : i64
    }
    emitc.switch %1 : i64 
    default {
    }
    return
  }
}

