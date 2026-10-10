"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "test"}> ({
    %0 = "test.constant"() <{value = 5 : i32}> : () -> i32
    %1 = "test.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "test.constant"() <{value = 2 : i32}> : () -> i32
    %3 = "test.constant"() <{value = 3 : i32}> : () -> i32
    %4 = "test.fold_with_fold_adaptor"(%0, %1, %2, %3, %3) <{attr = array<i32: 1, 1>, operandSegmentSizes = array<i32: 1, 2, 2>}> ({
      %5 = "test.constant"() <{value = 0 : i32}> : () -> i32
    }) : (i32, i32, i32, i32, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

