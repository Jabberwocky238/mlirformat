"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "foo"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8)):
    "func.return"(%arg0) {a} : (i32) -> () loc("<stdin>":4:5)
  }) {tag = "foo"} : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
