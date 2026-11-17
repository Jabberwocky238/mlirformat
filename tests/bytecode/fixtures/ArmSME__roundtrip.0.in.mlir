"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "arm_sme_get_tile_i8"}> ({
    %0 = "arm_sme.get_tile"() : () -> vector<[16]x[16]xi8> loc("<stdin>":3:10)
    "func.return"() : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
