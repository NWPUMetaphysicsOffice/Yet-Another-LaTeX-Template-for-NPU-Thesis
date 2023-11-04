import os

badges_urls = [
    r"https://img.shields.io/badge/status-complete-brightgreen.svg?style=flat-square",
    r"https://img.shields.io/badge/PhD-Thesis-D11A2D.svg?style=flat-square",
    r"https://img.shields.io/badge/Master-Thesis-1177B0.svg?style=flat-square",
    r"https://img.shields.io/badge/TeX-Template-3D6117.svg?style=flat-square",
    r"https://img.shields.io/badge/license-GNU_General_Public_License_v3.0-blue.svg?style=flat-square",
    r"https://img.shields.io/badge/TeXLive-%3E=2021-3D6117.svg?style=flat-square",
    r"https://img.shields.io/badge/version-v1.8.5.0307-674EA7.svg?style=flat-square",
    r"https://img.shields.io/badge/DOI-10.5281%2Fzenodo.4159248-blue.svg?style=flat-square"
]

for i, url in enumerate(badges_urls):
    print(f"curl -o badge_{i:02d}.svg {url}")
    os.system(f"curl -o badge_{i:02d}.svg {url}")
