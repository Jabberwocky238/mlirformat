//! Debug helper: `cargo run --example dbg -- FILE [CHUNK]` parses with the upstream dialects,
//! prints, reparses, diffs; `cargo run --example dbg -- -e 'TEXT'` explains one op.
use mlirformat::*;

fn main() {
    let args: Vec<String> = std::env::args().collect();
    let opt = MlirOpt::upstream();
    if args[1] == "-e" {
        let op = opt.parse_op(&args[2]).unwrap_or_else(|e| panic!("{e}"));
        println!("{op:?}");
        match opt.template(&op.name) {
            Some(_) => {
                println!("{}", opt.show(&op));
                for e in [func::Func::try_from(&op).err(), arith::Arith::try_from(&op).err(), cf::Cf::try_from(&op).err(), builtin::Builtin::try_from(&op).err()] {
                    println!("{e:?}");
                }
            }
            None => println!("not in the op table"),
        }
        return;
    }
    let src = std::fs::read_to_string(&args[1]).unwrap();
    let chunk = args.get(2).map_or(src.as_str(), |i| src.split("// -----").nth(i.parse().unwrap()).unwrap());
    let m = opt.parse(chunk).unwrap_or_else(|e| panic!("{e}"));
    let text = opt.show(&m).to_string();
    let again = opt.parse(&text).unwrap_or_else(|e| panic!("reparse {e}\n{text}"));
    if again != m {
        let (a, b) = (format!("{m:#?}"), format!("{again:#?}"));
        let at = a.lines().zip(b.lines()).position(|(x, y)| x != y).unwrap_or(0);
        let ctx = |s: &str| s.lines().skip(at.saturating_sub(8)).take(14).collect::<Vec<_>>().join("\n");
        println!("MISMATCH at debug line {at}\n--- first\n{}\n--- second\n{}", ctx(&a), ctx(&b));
    } else {
        println!("{text}");
    }
}
