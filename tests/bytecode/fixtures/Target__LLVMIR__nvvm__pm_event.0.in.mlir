"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_pmevent_mask", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.pmevent"() <{maskedEventId = 15000 : i16}> : () -> () loc("<stdin>":3:5)
    "nvvm.pmevent"() <{maskedEventId = 4 : i16}> : () -> () loc("<stdin>":4:5)
    "llvm.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_pmevent_id", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.pmevent"() <{eventId = 10 : i32}> : () -> () loc("<stdin>":8:5)
    "nvvm.pmevent"() <{eventId = 4 : i32}> : () -> () loc("<stdin>":9:5)
    "llvm.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
