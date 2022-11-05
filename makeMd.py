#!/usr/bin/env python3

import argparse
import json

parser = argparse.ArgumentParser()
parser.add_argument("report", type=str, help="Name of the image for the page.")
parser.add_argument("--format", type=str, help="The format of the input.")
parser.add_argument("-o", type=str, help="The output file.")
args = parser.parse_args()

data = None
with open(args.report, "r") as fp:
    data = json.load(fp)

output = ""

if args.format == "sarif":
    run = data["runs"][0]
    tool = run['tool']['driver']['name']
    output += f"# {run['tool']['driver']['name']}\nFindings\n| ID | Severity | Description |\n"
    results = run["results"]
    for result in results:
        output += f"| {result['ruleId']} | {result['level']} | {result['message']['text']} |\n"

    with open(args.o, "w") as fp:
        fp.write(output)
