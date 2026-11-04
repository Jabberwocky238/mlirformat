"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!shape.shape, !shape.shape) -> index, sym_name = "f"}> ({
  ^bb0(%arg0: !shape.shape, %arg1: !shape.shape):
    %0 = "shape.cstr_broadcastable"(%arg0, %arg1) : (!shape.shape, !shape.shape) -> !shape.witness
    %1 = "shape.assuming"(%0) ({
      %2 = "test.source"() : () -> index
      "shape.assuming_yield"(%2) : (index) -> ()
    }) : (!shape.witness) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!shape.shape, !shape.shape) -> index, sym_name = "f"}> ({
  ^bb0(%arg0: !shape.shape, %arg1: !shape.shape):
    %0 = "shape.cstr_eq"(%arg0, %arg1) : (!shape.shape, !shape.shape) -> !shape.witness
    %1 = "shape.assuming"(%0) ({
      %2 = "test.source"() : () -> index
      "shape.assuming_yield"(%2) : (index) -> ()
    }) : (!shape.witness) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!shape.shape, !shape.shape) -> index, sym_name = "f"}> ({
  ^bb0(%arg0: !shape.shape, %arg1: !shape.shape):
    %0 = "shape.cstr_broadcastable"(%arg0, %arg1) : (!shape.shape, !shape.shape) -> !shape.witness
    %1 = "shape.cstr_eq"(%arg0, %arg1) : (!shape.shape, !shape.shape) -> !shape.witness
    %2 = "shape.assuming_all"(%0, %1) : (!shape.witness, !shape.witness) -> !shape.witness
    %3 = "shape.assuming"(%0) ({
      %4 = "test.source"() : () -> index
      "shape.assuming_yield"(%4) : (index) -> ()
    }) : (!shape.witness) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

