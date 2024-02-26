use regex::Regex;
use std::env;
use std::fs::File;
use std::io::{self, BufRead, BufReader};

fn main() -> io::Result<()> {
    let arguments: Vec<String> = env::args().collect();
    if arguments.len() < 2 {
        eprintln!("Usage: <Path> <Pattern>");
        std::process::exit(1);
    }
    let file_path = &arguments[1];
    let pattern = &arguments[2];

    if let Err(e) = search_regex_pattern_in_file(file_path, pattern) {
        eprintln!("Error searching file: {}", e);
        return Err(e);
    }

    Ok(())
}

fn search_regex_pattern_in_file(file_path: &str, pattern: &str) -> io::Result<()> {
    let regex = Regex::new(pattern).expect("Invalid regex pattern");
    let file = File::open(file_path)?;
    let reader = BufReader::new(file);

    let mut match_found = false;
    for line_result in reader.lines() {
        let line = line_result?;
        if regex.is_match(&line) {
            println!("Match found: {}", line);
            match_found = true;
        }
    }

    if !match_found {
        println!("No matches found");
    }

    Ok(())
}
