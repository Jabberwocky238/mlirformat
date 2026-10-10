//! The `mlirformat` command line: one subcommand per folder, each with its `Args` and `run`.
//!
//! ```text
//! mlirformat tblgen mlir/include/mlir/Dialect/Arith/IR/ArithOps.td -I mlir/include -o src/dialects
//! ```

mod tblgen;

use std::process::ExitCode;

use clap::{Parser, Subcommand};

#[derive(Parser)]
#[command(name = "mlirformat", version, about = "MLIR text ⇄ IR ⇄ typed Rust ops")]
struct Cli {
    #[command(subcommand)]
    command: Command,
}

#[derive(Subcommand)]
enum Command {
    /// Generate `<dialect>.gen.rs` (`#[mlir::op]` structs + a `#[mlir::dialect]` enum) from an ODS `.td` file.
    Tblgen(tblgen::Args),
}

fn main() -> ExitCode {
    let done = match Cli::parse().command {
        Command::Tblgen(args) => args.run(),
    };
    match done {
        Ok(()) => ExitCode::SUCCESS,
        Err(e) => {
            eprintln!("error: {e}");
            ExitCode::FAILURE
        }
    }
}
