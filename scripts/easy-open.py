#!/usr/bin/env python3
"""
easy-open.py
============
"""

import argparse
import configparser
from pathlib import Path
import subprocess
import sys


def parse_args() -> argparse.Namespace:
    parser: argparse.ArgumentParser = argparse.ArgumentParser()
    parser.add_argument("-c", "--config", type=Path, help="Location of easy-open config file")
    parser.add_argument("file", type=Path, help="File to open")
    return parser.parse_args()

def read_config(config_file: Path) -> dict:
    if not config_file.exists(): return {}
    c = configparser.ConfigParser()
    c.read(config_file)
    return {s: dict(c.items(s)) for s in c.sections()}

def backup(path: Path) -> int:
    subprocess.Popen(f"xdg-open {path}", shell=True)
    return 0

def easy_open(path, config: dict = {}) -> int:
    extension: str = path.suffix[1:]
    type_map: dict = config.get("easy-open", {})
    command: str = type_map.get(extension, "").strip("\"")
    if extension == "" and "default" in type_map:
        command = config.get("easy-open.settings", {}).get("empty", "").strip("\"")
    elif extension not in type_map:
        return backup(path)
    subprocess.Popen(f"{command} {path}", shell=True)
    return 0

if __name__ == "__main__":
    args: argparse.Namespace = parse_args()
    config: dict = read_config(args.config)
    print(config)
    sys.exit(easy_open(args.file, config))
