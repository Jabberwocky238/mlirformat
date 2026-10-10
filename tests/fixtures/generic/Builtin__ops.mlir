"builtin.module"() ({
  %0 = "foo.op"() : () -> !foo.type
  %1 = "foo.op"() : () -> !foo.tuple_type<!foo.type, !foo.type>
  %2 = "builtin.unrealized_conversion_cast"() : () -> !bar.tuple_type<>
  %3 = "builtin.unrealized_conversion_cast"(%0) : (!foo.type) -> !bar.lowered_type
  %4:2 = "builtin.unrealized_conversion_cast"(%1) : (!foo.tuple_type<!foo.type, !foo.type>) -> (!foo.type, !foo.type)
  %5 = "builtin.unrealized_conversion_cast"(%0, %0) : (!foo.type, !foo.type) -> !bar.tuple_type<!foo.type, !foo.type>
  %6 = "foo.op"() : () -> vector<[4]xi32>
  %7 = "foo.op"() : () -> vector<[2]x[2]xf64>
  %8 = "foo.op"() : () -> vector<2x[4]xbf16>
  %9 = "foo.op"() : () -> vector<2x2x[4]x[4]xi8>
}) : () -> ()

