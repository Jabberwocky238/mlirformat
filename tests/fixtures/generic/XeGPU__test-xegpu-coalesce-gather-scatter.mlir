"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernel", targets = [#xevm.target<chip = "pvc">]}> ({
    "gpu.func"() <{function_type = (i64) -> vector<32xf32>}> ({
    ^bb0(%arg0: i64):
      %0 = "vector.step"() : () -> vector<32xindex>
      %1 = "arith.constant"() <{value = dense<true> : vector<32xi1>}> : () -> vector<32xi1>
      %2 = "xegpu.load"(%arg0, %0, %1) : (i64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
      "gpu.return"(%2) : (vector<32xf32>) -> ()
    }) {sym_name = "load_step"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernel_store", targets = [#xevm.target<chip = "pvc">]}> ({
    "gpu.func"() <{function_type = (i64, vector<32xf32>) -> ()}> ({
    ^bb0(%arg0: i64, %arg1: vector<32xf32>):
      %0 = "vector.step"() : () -> vector<32xindex>
      %1 = "arith.constant"() <{value = dense<true> : vector<32xi1>}> : () -> vector<32xi1>
      "xegpu.store"(%arg1, %arg0, %0, %1) : (vector<32xf32>, i64, vector<32xindex>, vector<32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_step"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernel_stride4", targets = [#xevm.target<chip = "pvc">]}> ({
    "gpu.func"() <{function_type = (i64) -> vector<32xf32>}> ({
    ^bb0(%arg0: i64):
      %0 = "arith.constant"() <{value = 4 : index}> : () -> index
      %1 = "vector.step"() : () -> vector<32xindex>
      %2 = "vector.broadcast"(%0) : (index) -> vector<32xindex>
      %3 = "arith.muli"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (vector<32xindex>, vector<32xindex>) -> vector<32xindex>
      %4 = "arith.constant"() <{value = dense<true> : vector<32xi1>}> : () -> vector<32xi1>
      %5 = "xegpu.load"(%arg0, %3, %4) : (i64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
      "gpu.return"(%5) : (vector<32xf32>) -> ()
    }) {sym_name = "load_stride4_unchanged"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernel_2d", targets = [#xevm.target<chip = "pvc">]}> ({
    "gpu.func"() <{function_type = (i64) -> vector<1x32xf32>}> ({
    ^bb0(%arg0: i64):
      %0 = "vector.step"() : () -> vector<32xindex>
      %1 = "vector.shape_cast"(%0) : (vector<32xindex>) -> vector<1x32xindex>
      %2 = "arith.constant"() <{value = dense<true> : vector<1x32xi1>}> : () -> vector<1x32xi1>
      %3 = "xegpu.load"(%arg0, %1, %2) : (i64, vector<1x32xindex>, vector<1x32xi1>) -> vector<1x32xf32>
      "gpu.return"(%3) : (vector<1x32xf32>) -> ()
    }) {sym_name = "load_2d_leading_unit"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernel_chunk4", targets = [#xevm.target<chip = "pvc">]}> ({
    "gpu.func"() <{function_type = (i64) -> vector<32xf32>}> ({
    ^bb0(%arg0: i64):
      %0 = "vector.step"() : () -> vector<32xindex>
      %1 = "arith.constant"() <{value = dense<true> : vector<32xi1>}> : () -> vector<32xi1>
      %2 = "xegpu.load"(%arg0, %0, %1) : (i64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
      "gpu.return"(%2) : (vector<32xf32>) -> ()
    }) {sym_name = "load_step_chunk4"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i64) -> vector<32xf32>, sym_name = "load_no_target_unchanged"}> ({
  ^bb0(%arg0: i64):
    %0 = "vector.step"() : () -> vector<32xindex>
    %1 = "arith.constant"() <{value = dense<true> : vector<32xi1>}> : () -> vector<32xi1>
    %2 = "xegpu.load"(%arg0, %0, %1) : (i64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
    "func.return"(%2) : (vector<32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

