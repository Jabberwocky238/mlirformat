"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "cast"}> ({
  ^bb0(%arg1: i32):
    %1 = "emitc.cast"(%arg1) : (i32) -> ui32
    %2 = "emitc.cast"(%arg1) : (i32) -> i64
    %3 = "emitc.cast"(%arg1) : (i32) -> ui64
    %4 = "emitc.cast"(%arg1) : (i32) -> f32
    %5 = "emitc.cast"(%arg1) : (i32) -> f64
    %6 = "emitc.cast"(%arg1) : (i32) -> i1
    %7 = "emitc.cast"(%arg1) : (i32) -> !emitc.opaque<"mytype">
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.ptr<!emitc.opaque<"void">>) -> (), sym_name = "cast_ptr"}> ({
  ^bb0(%arg0: !emitc.ptr<!emitc.opaque<"void">>):
    %0 = "emitc.cast"(%arg0) : (!emitc.ptr<!emitc.opaque<"void">>) -> !emitc.ptr<i32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

