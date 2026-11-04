"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.any<i8<-8:7>:f32>, sym_name = "parseFullySpecified"}> ({
    %0 = "foo"() : () -> !quant.any<i8<-8:7>:f32>
    "func.return"(%0) : (!quant.any<i8<-8:7>:f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.any<i8<-8:7>>, sym_name = "parseNoExpressedType"}> ({
    %0 = "foo"() : () -> !quant.any<i8<-8:7>>
    "func.return"(%0) : (!quant.any<i8<-8:7>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> !quant.any<i8>, sym_name = "parseOnlyStorageType"}> ({
    %0 = "foo"() : () -> !quant.any<i8>
    "func.return"(%0) : (!quant.any<i8>) -> ()
  }) : () -> ()
}) : () -> ()

