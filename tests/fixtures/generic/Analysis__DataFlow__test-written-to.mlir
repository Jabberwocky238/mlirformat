"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, memref<i32>) -> (memref<i32>, memref<i32>), sym_name = "test_two_writes"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    %0 = "arith.constant"() <{value = 0 : i32}> {tag = "constant0"} : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> {tag = "constant1"} : () -> i32
    "memref.store"(%0, %arg0) {tag_name = "a"} : (i32, memref<i32>) -> ()
    "memref.store"(%1, %arg1) {tag_name = "b"} : (i32, memref<i32>) -> ()
    "func.return"(%arg0, %arg1) : (memref<i32>, memref<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, memref<i32>, i1) -> (), sym_name = "test_if"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: i1):
    %0 = "arith.constant"() <{value = 2 : i32}> {tag = "c0"} : () -> i32
    %1 = "arith.constant"() <{value = 3 : i32}> {tag = "c1"} : () -> i32
    %2 = "arith.addi"(%arg2, %arg2) <{overflowFlags = #arith.overflow<none>}> {tag = "condition"} : (i1, i1) -> i1
    %3:2 = "scf.if"(%2) ({
      %5 = "arith.constant"() <{value = 0 : i32}> {tag = "c2"} : () -> i32
      "scf.yield"(%5, %0) : (i32, i32) -> ()
    }, {
      %4 = "arith.constant"() <{value = 1 : i32}> {tag = "c3"} : () -> i32
      "scf.yield"(%4, %1) : (i32, i32) -> ()
    }) : (i1) -> (i32, i32)
    "memref.store"(%3#0, %arg0) {tag_name = "a"} : (i32, memref<i32>) -> ()
    "memref.store"(%3#1, %arg1) {tag_name = "b"} : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, memref<i32>, memref<i32>, i1) -> (), sym_name = "test_blocks"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: memref<i32>, %arg3: i1):
    %0 = "arith.constant"() <{value = 0 : i32}> {tag = "c0"} : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> {tag = "c1"} : () -> i32
    "cf.cond_br"(%arg3, %0, %1)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 1, 1>}> {tag = "br"} : (i1, i32, i32) -> ()
  ^bb1(%2: i32):  // pred: ^bb0
    "memref.store"(%2, %arg0) {tag_name = "a"} : (i32, memref<i32>) -> ()
    "cf.br"(%2)[^bb3] : (i32) -> ()
  ^bb2(%3: i32):  // pred: ^bb0
    "memref.store"(%3, %arg1) {tag_name = "b"} : (i32, memref<i32>) -> ()
    "cf.br"(%3)[^bb3] : (i32) -> ()
  ^bb3(%4: i32):  // 2 preds: ^bb1, ^bb2
    "memref.store"(%4, %arg2) {tag_name = "c"} : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "test_infinite_loop"}> ({
  ^bb0(%arg0: memref<i32>):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 2 : i32}> {tag = "two"} : () -> i32
    %3 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    "cf.br"(%0, %1, %2)[^bb1] : (i32, i32, i32) -> ()
  ^bb1(%4: i32, %5: i32, %6: i32):  // 2 preds: ^bb0, ^bb1
    "memref.store"(%4, %arg0) {tag_name = "a"} : (i32, memref<i32>) -> ()
    "cf.br"(%5, %6, %3)[^bb1] : (i32, i32, i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, memref<i32>) -> (), sym_name = "test_switch"}> ({
  ^bb0(%arg0: i32, %arg1: memref<i32>):
    %0 = "arith.constant"() <{value = 0 : i32}> {tag = "c0"} : () -> i32
    "cf.switch"(%arg0, %0, %0, %0)[^bb1, ^bb2, ^bb3] <{case_operand_segments = array<i32: 1, 1>, case_values = dense<[42, 43]> : vector<2xi32>, operandSegmentSizes = array<i32: 1, 1, 2>}> : (i32, i32, i32, i32) -> ()
  ^bb1(%1: i32):  // pred: ^bb0
    "memref.store"(%1, %arg1) {tag_name = "a"} : (i32, memref<i32>) -> ()
    "cf.br"(%1)[^bb3] : (i32) -> ()
  ^bb2(%2: i32):  // pred: ^bb0
    "memref.store"(%2, %arg1) {tag_name = "b"} : (i32, memref<i32>) -> ()
    "cf.br"(%2)[^bb3] : (i32) -> ()
  ^bb3(%3: i32):  // 3 preds: ^bb0, ^bb1, ^bb2
    "memref.store"(%3, %arg1) {tag_name = "c"} : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, f32) -> (), sym_name = "test_caller"}> ({
  ^bb0(%arg1: memref<f32>, %arg2: f32):
    %2 = "arith.addf"(%arg2, %arg2) <{fastmath = #arith.fastmath<none>}> {tag = "add"} : (f32, f32) -> f32
    %3 = "func.call"(%2) <{callee = @callee}> : (f32) -> f32
    %4 = "arith.mulf"(%3, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %5 = "arith.mulf"(%4, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %6 = "arith.mulf"(%5, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "memref.store"(%6, %arg1) {tag_name = "a"} : (f32, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "callee", sym_visibility = "private"}> ({
  ^bb0(%arg0: f32):
    %0 = "arith.mulf"(%arg0, %arg0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %1 = "arith.mulf"(%0, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "callee", sym_visibility = "private"}> ({
  ^bb0(%arg2: f32):
    %2 = "arith.mulf"(%arg2, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>, f32) -> (), sym_name = "test_caller_below_callee"}> ({
  ^bb0(%arg0: memref<f32>, %arg1: f32):
    %0 = "arith.subf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> {tag = "sub"} : (f32, f32) -> f32
    %1 = "func.call"(%0) <{callee = @callee}> : (f32) -> f32
    "memref.store"(%1, %arg0) {tag_name = "a"} : (f32, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "callee1", sym_visibility = "private"}> ({
  ^bb0(%arg4: f32):
    %3 = "func.call"(%arg4) <{callee = @callee2}> : (f32) -> f32
    "func.return"(%3) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "callee2", sym_visibility = "private"}> ({
  ^bb0(%arg3: f32):
    %2 = "func.call"(%arg3) <{callee = @callee3}> : (f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "callee3", sym_visibility = "private"}> ({
  ^bb0(%arg2: f32):
    "func.return"(%arg2) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>, f32) -> (), sym_name = "test_callchain"}> ({
  ^bb0(%arg0: memref<f32>, %arg1: f32):
    %0 = "arith.mulf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> {tag = "mul"} : (f32, f32) -> f32
    %1 = "func.call"(%0) <{callee = @callee1}> : (f32) -> f32
    "memref.store"(%1, %arg0) {tag_name = "a"} : (f32, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, i32, i1) -> (), sym_name = "test_while"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: i32, %arg2: i1):
    %0 = "arith.constant"() <{value = 0 : i32}> {tag = "zero"} : () -> i32
    %1 = "arith.addi"(%arg1, %arg1) <{overflowFlags = #arith.overflow<none>}> {tag = "init"} : (i32, i32) -> i32
    %2:2 = "scf.while"(%0, %1) ({
    ^bb0(%arg5: i32, %arg6: i32):
      "memref.store"(%arg6, %arg0) {tag_name = "a"} : (i32, memref<i32>) -> ()
      "scf.condition"(%arg2, %arg5, %arg6) {tag = "condition"} : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg3: i32, %arg4: i32):
      "memref.store"(%arg3, %arg0) {tag_name = "c"} : (i32, memref<i32>) -> ()
      %3 = "arith.addi"(%arg4, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "scf.yield"(%3, %3) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    "memref.store"(%2#1, %arg0) {tag_name = "b"} : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>, i1) -> (), sym_name = "test_complex_while"}> ({
  ^bb0(%arg0: memref<i32>, %arg1: i1):
    %0 = "arith.constant"() <{value = 0 : i32}> {tag = "zero"} : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> {tag = "one"} : () -> i32
    %2 = "scf.while"(%0, %1) ({
    ^bb0(%arg3: i32, %arg4: i32):
      "scf.condition"(%arg1, %arg4) {tag = "condition"} : (i1, i32) -> ()
    }, {
    ^bb0(%arg2: i32):
      "scf.yield"(%arg2, %arg2) : (i32, i32) -> ()
    }) : (i32, i32) -> i32
    "memref.store"(%2, %arg0) {tag_name = "a"} : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "test_for"}> ({
  ^bb0(%arg0: memref<i32>):
    %0 = "arith.constant"() <{value = 0 : index}> {tag = "zero"} : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> {tag = "ten"} : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> {tag = "one"} : () -> index
    %3 = "arith.constant"() <{value = 0 : i32}> {tag = "x"} : () -> i32
    %4 = "scf.for"(%0, %1, %2, %3) ({
    ^bb0(%arg1: index, %arg2: i32):
      "scf.yield"(%arg2) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "memref.store"(%4, %arg0) {tag_name = "a"} : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<i32>) -> (), sym_name = "test_switch"}> ({
  ^bb0(%arg0: index, %arg1: memref<i32>):
    %0:2 = "scf.index_switch"(%arg0) <{cases = array<i64: 1, 2>}> ({
      %5 = "arith.constant"() <{value = 30 : i32}> {tag = "default_a"} : () -> i32
      %6 = "arith.constant"() <{value = 300 : i32}> {tag = "default_b"} : () -> i32
      "scf.yield"(%5, %6) : (i32, i32) -> ()
    }, {
      %3 = "arith.constant"() <{value = 10 : i32}> {tag = "1a"} : () -> i32
      %4 = "arith.constant"() <{value = 100 : i32}> {tag = "1b"} : () -> i32
      "scf.yield"(%3, %4) : (i32, i32) -> ()
    }, {
      %1 = "arith.constant"() <{value = 20 : i32}> {tag = "2a"} : () -> i32
      %2 = "arith.constant"() <{value = 200 : i32}> {tag = "2b"} : () -> i32
      "scf.yield"(%1, %2) : (i32, i32) -> ()
    }) {tag = "switch"} : (index) -> (i32, i32)
    "memref.store"(%0#0, %arg1) {tag_name = "a"} : (i32, memref<i32>) -> ()
    "memref.store"(%0#1, %arg1) {tag_name = "b"} : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64):
    "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @decl, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "callee", sym_visibility = "private"}> ({
  ^bb0(%arg4: i32, %arg5: i32):
    "func.return"(%arg4) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, memref<i32>) -> (), sym_name = "test_call_on_device"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: memref<i32>):
    %0 = "test.call_on_device"(%arg0, %arg1, %arg2) <{callee = @callee}> {tag = "a"} : (i32, i32, i32) -> i32
    "memref.store"(%0, %arg3) {tag_name = "b"} : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "external_callee", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (i32, memref<i32>) -> (), sym_name = "test_external_callee"}> ({
  ^bb0(%arg0: i32, %arg1: memref<i32>):
    %0 = "arith.addi"(%arg0, %arg0) <{overflowFlags = #arith.overflow<none>}> {tag = "add_external"} : (i32, i32) -> i32
    %1 = "func.call"(%arg0) <{callee = @external_callee}> : (i32) -> i32
    "memref.store"(%1, %arg1) {tag_name = "a"} : (i32, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

