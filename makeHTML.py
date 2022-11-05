#!/usr/bin/env python3

import argparse
import json

parser = argparse.ArgumentParser()
parser.add_argument("report", type=str, help="Name of the image for the page.")
parser.add_argument("--format", type=str, help="The format of the input.")
args = parser.parse_args()

data = None
with open(args.report, "r") as fp:
    data = json.load(fp)

output = ""

if args.format == "sarif":
    results = data["runs"][0]["results"]
    output += "# "
    for result in results:
        print(result)
