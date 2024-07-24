import re
import sys

"""Regex : ^ from the start of the line. 
\+: matches + sign. \s*: matches whitespace between + and other text. - matches hypen. title: matches title. 
(.*?): Matches package name. "\n:" matches newline. \+ matches plus sign. again (.*?) to capture version """


def parse_diff(diff):
    new_packages = []
    package_pattern = re.compile(r'^\+\s*-\s*title:\s*(.*?)\n\+\s*version:\s*(.*?)$', re.MULTILINE)

    matches = package_pattern.findall(diff)
    for match in matches:
        title, version = match
        new_packages.append(f"{title} (v{version})")

    return new_packages

if __name__ == "__main__":
    diff = sys.stdin.read()
    new_packages = parse_diff(diff)
    
    if new_packages:
        toot_content = "New packages in the community-archive:\n"
        toot_content += "\n".join(new_packages)
        toot_content += "\ngithub.com/poseidon-framework/community-archive #aDNA #OpenData"
        print(toot_content)
    else:
        print("No new package information has been found in this PR")

