"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple1"}> ({
    "test_affine_map"() {affine_map = affine_map<(d0) -> (d0 - 1)>} : () -> () loc("<stdin>":5:5)
    "test_affine_map"() {affine_map = affine_map<(d0) -> (d0 + 1)>} : () -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
