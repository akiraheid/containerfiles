"""Generate the HTML page with scan results for all images."""

import json
import os
from shutil import rmtree
import subprocess

root_dir = os.getcwd()
scan_dir = "scans"
html_name = "index.html"
trivy_version = "0.34.0"
clamav_version = "0.105"

def clamav_to_html(data):
    """Convert ClamAV text to HTML."""
    ret = "<h3>ClamAV</h3>\n"

    # Expected format
    #     Infected files: 0
    infected_files = int(data.split("\n")[6].split(":")[1])
    if infected_files == 0:
        ret += "<p>No findings</p>"
        return ret

    # Not sure what a finding looks like so just put the whole text for now
    ret += data

    return ret

def del_image(archive):
    print(f"Deleting {archive}")
    os.remove(archive)

def del_scan_results():
    print("Deleting scan results")
    rmtree(scan_dir)

def get_image_dirs():
    """Return the dirs for image definitions."""
    dirs = next(os.walk(root_dir))[1]
    ignore_dirs = [".git", "scans", "grype", "trivy", "x11docker"]

    return sorted([x for x in dirs if not x in ignore_dirs])

def load_json(file):
    data = None
    with open(file, "r") as fp:
        data = json.load(fp)
    return data

def trivy_to_html(data):
    """Convert Trivy SARIF data to HTML."""
    ret = "<h3>Trivy</h3>\n"

    findings = data["runs"][0]["tool"]["driver"]["rules"]

    if not findings:
        return ret + "<p>No findings</p>\n"

    results = []
    for finding in findings:
        severity = finding["properties"]["security-severity"]
        _id = finding["id"]
        url = finding.get("helpUri", "")
        level = finding["properties"]["tags"][2]
        description = finding["fullDescription"]["text"]
        results += [(severity, _id, url, level, description)]

    results.sort(reverse=True)

    ret += "<table>\n"
    ret += "<tr>\n<th>ID</th><th>Severity</th><th>Description</th></tr>\n"

    # Table format is | ID | Severity | Description |
    for _, _id, url, level, description in results:
        ret += f'<tr><td><a href="{url}">{_id}</a></td><td>{level}</td><td>{description}</td></tr>\n'

    ret += "</table>\n"

    return ret

def make_html(results_dir):
    """Generate the report HTML page."""
    print("Generate HTML")
    style = """\
            body {
                background-color: #000000;
                color: #efefef;
            }

            a {
                color: #efefef;
            }

            td {
                margin: 1em;
                padding: 1em;
            }
    """
    output = f"<!DOCTYPE html>\n<html>\n<head><style>{style}</style></head>\n<body>\n"
    output += "<h1>Container scan results</h1>\n"

    dirs = get_image_dirs()

    # Create table of contents
    output += "<ul>\n"
    for image in dirs:
        output += f'<li><a href="#{image}">{image}</a></li>\n'

    output += "</ul>\n"

    # Create section for each image
    dirs = list(dirs)
    for image in dirs:
        output += f'<h2 id="{image}">{image}</h2>\n'

        data = None
        with open(f"scans/{image}-clamav.txt", "r") as fp:
            data = fp.read()

        output += clamav_to_html(data)

        data = load_json(f"scans/{image}-trivy.json")
        output += trivy_to_html(data)

    output += "</body>\n</html>"
    with open(html_name, "w") as fp:
        fp.write(output)

    print("Generate HTML - done")

def save_image(dirname):
    archive = f"{scan_dir}/{dirname}.tar"
    print(f"Saving image as {archive}")
    command = ["podman", "save", "-o", archive, f"localhost/{dirname}:latest"]
    subprocess.run(command)
    return archive

def scan_clamav(archive_name):
    print("... with ClamAV")
    cache = "clamav-cache"
    image = archive_name.split(".")[0]
    command = ["podman", "run", "--pull", "always", "--rm", "-v", f"{cache}:/var/lib/clamav/:rw",
            "-v", f"{root_dir}/{scan_dir}/:/root/{scan_dir}/:rw",
            "-w", f"/root/{scan_dir}",
            f"docker.io/clamav/clamav:{clamav_version}", "clamscan", archive_name]

    proc = subprocess.run(command, capture_output=True)
    out = proc.stdout.decode("utf-8")
    with open(f"{image}-clamav.txt", "w") as fp:
        fp.write(out)

def scan_trivy(archive_name):
    print("... with Trivy")
    cache = "trivy-cache"
    image = archive_name.split(".")[0]
    command = ["podman", "run", "--rm", "-v", f"{cache}:/root/.cache/:rw",
            "-v", f"{root_dir}/{scan_dir}/:/root/{scan_dir}/:rw",
            "-w", "/root",
            f"docker.io/aquasec/trivy:{trivy_version}", "image", "--format", "sarif",
                "-o", f"{image}-trivy.json", "--input", archive_name]

    subprocess.run(command)

if __name__ == "__main__":
    image_dirs = get_image_dirs()
    if not os.path.isdir(scan_dir):
        os.mkdir(scan_dir)

    for image_dir in image_dirs:
        archive = save_image(image_dir)
        print(f"Scanning {archive}")
        scan_clamav(archive)
        scan_trivy(archive)
        del_image(archive)

    make_html(scan_dir)
    del_scan_results()
