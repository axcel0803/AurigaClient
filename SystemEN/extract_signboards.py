import re

# Read the test file
with open(r'e:\cworks\ragnarok\jro\SystemEN\test', 'r', encoding='utf-8') as f:
    content = f.read()

# Pattern to match signboard entries
pattern = r'\{\s*"([^"]+)"\s*,\s*(\d+)\s*,\s*(\d+)'

# Find all matches
matches = re.findall(pattern, content)

# Write output
with open(r'e:\cworks\ragnarok\jro\SystemEN\SignBoardIgnore_output.txt', 'w', encoding='utf-8') as f:
    f.write("SignBoardIgnore = {\n")
    for map_name, x, y in matches:
        f.write(f'\t{{ "{map_name}", {x}, {y}}},\n')
    f.write("}\n")

print(f"Extracted {len(matches)} signboards")
print("Output saved to: SignBoardIgnore_output.txt")
