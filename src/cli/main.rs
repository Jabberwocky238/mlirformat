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
