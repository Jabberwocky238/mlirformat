"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_default_init"}> ({
    "test.foo"() {tag = "a"} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_one_join"}> ({
    "test.foo"() {tag = "a"} : () -> ()
    "test.foo"() {foo = 1 : ui64, tag = "b"} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_two_join"}> ({
    "test.foo"() {tag = "a"} : () -> ()
    "test.foo"() {foo = 1 : ui64, tag = "b"} : () -> ()
    "test.foo"() {foo = 1 : ui64, tag = "c"} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_fork"}> ({
    "test.branch"()[^bb1, ^bb2] {foo = 1 : ui64, tag = "init"} : () -> ()
  ^bb1:  // pred: ^bb0
    "test.branch"()[^bb3] {foo = 2 : ui64, tag = "a"} : () -> ()
  ^bb2:  // pred: ^bb0
    "test.branch"()[^bb3] {foo = 4 : ui64, tag = "b"} : () -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "test.foo"() {tag = "end"} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_simple_loop"}> ({
    "test.branch"()[^bb1] {foo = 1 : ui64, tag = "init"} : () -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb1
    "test.foo"() {foo = 3 : ui64, tag = "a"} : () -> ()
    "test.branch"()[^bb1, ^bb2] : () -> ()
  ^bb2:  // pred: ^bb1
    "test.foo"() {tag = "end"} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_double_loop"}> ({
    "test.branch"()[^bb1] {foo = 2 : ui64, tag = "init"} : () -> ()
  ^bb1:  // 3 preds: ^bb0, ^bb1, ^bb2
    "test.foo"() {foo = 3 : ui64, tag = "a"} : () -> ()
    "test.branch"()[^bb1, ^bb2] : () -> ()
  ^bb2:  // pred: ^bb1
    "test.foo"() {foo = 5 : ui64, tag = "b"} : () -> ()
    "test.branch"()[^bb1, ^bb3] : () -> ()
  ^bb3:  // pred: ^bb2
    "test.foo"() {tag = "end"} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

