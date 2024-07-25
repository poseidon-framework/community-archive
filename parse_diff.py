import re
import sys

"""Regex : ^ from the start of the line. 
\+: matches + sign. \s*: matches whitespace between + and other text. - matches hypen. title: matches title. 
(.*?): Matches package name. "\n:" matches newline. \+ matches plus sign. again (.*?) to capture version """


def parse_diff(diff):
    new_packages = []
    # Regex 
    package_pattern = re.compile(r'^\+\s*-\s*title:\s*(.*?)\n\+\s*version:\s*(.*?)$', re.MULTILINE)

    matches = package_pattern.findall(diff)
    for match in matches:
        title, version = match
        new_packages.append(f"{title} (v{version})")

    return new_packages

def create_toot_content(new_packages, max_length=480):
    base_content = "New packages in the community-archive:\n"
    url_and_tags = "\ngithub.com/poseidon-framework/community-archive #aDNA #OpenData"
    available_length = max_length - len(base_content) - len(url_and_tags) #tracking the remaining character limit.
    
    toot_content = base_content #initial cha
    for package in new_packages:
        if len(toot_content) + len(package) + 2 > available_length:  # +2 for ", "
            toot_content += "..."
            break
        if toot_content != base_content:
            toot_content += "\n"
        toot_content += package
    
    toot_content += url_and_tags
    return toot_content

if __name__ == "__main__":
    diff = sys.stdin.read()
    new_packages = parse_diff(diff)
    
    if new_packages:
        toot_content = create_toot_content(new_packages)
        # console
        print(toot_content)
    else:
    
        print("No new package information has been found in this PR")
