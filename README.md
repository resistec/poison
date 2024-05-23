<p align=center>
  <br>
  <a href="https://github.com/resistec" target="_blank"><img src="https://"/></a>
  <br>
  <span>Speed up your POI investigations with Poison!</a></span>
  <br>
</p>

# Poison

## Introduction

Poison is an aggregation and automation tool that relies on existing open source intelligence (OSINT) collection tools (dorkScanner, sherlock, maigret, holehe) to execute a Person of Interest (POI) investigation workflow.

## What it does

Poison is a script that 
    1) receives user input about a target
    2) compiles a list of possible name and username variations
    3) feeds these variations to various collection tools
    4) cleans the output files of these tools, merges them and eliminates duplicates
    5) produces two files: 
        (a) a final report that contains URLs based on Google and Bing searches with    advanced search operators, as well as possible social media account URLs;
        (b) a report of email accounts from holehe.

## Use-Cases

- discover websites that display information about you (and issue GDPR requests to remove your data)
- investigate persons across the surface web 

## Note on usability

Poison spares time when an investigation requires exhaustive searches on a person of interest. Preliminary test runs suggest that Poison requires *20-30 minutes* to run a full cycle on one target, as compared to manual execution that would require 8-10 hours.

It, however, produces a large number of false positives that come from either the nature of the dependency tools, or from the workflow's working logic.

Use this tool for *high-profile targets* where *near-exhaustive* investigations are needed. 

Expect the program to run for 10-30 minutes and produce occasionally thousands of results that have to be manually verified. 

## Dependencies

This tool relies on the services of existing collection tools (dorkScanner, sherlock, maigret, holehe). It does not aim to purport to be independently providing the services of any of these programs.

Dependency tools: 

- dorkScanner: <https://github.com/madhavmehndiratta/dorkScanner>
- Sherlock: <https://github.com/sherlock-project/sherlock>
- Maigret: <https://github.com/soxoj/maigret>
- Holehe: <https://github.com/megadose/holehe>


## Installation

- this script runs only on Linux systems
- you will need bash, pip3, python3, dorkScanner, sherlock, maigret and holehe installed on your system
- the listed OSINT tools should be located in separate directories in the directory where this project directory resides

Step 1

Open your terminal and navigate to the directory where you would like to save Poison. Type:

```
git clone https://github.com/resistec/poison.git
```

Step 2
<p>make the shell scripts executable</p>

```
cd poison
sudo chmod +x poison.sh setup.sh
```

<p>if you don't have the dependencies installed, install them by running:</p>

```
./setup.sh
```

Step 3
<p>try Poison by typing:</p>

```
./poison.sh
```

## Contributions

Created by <a href="https://github.com/resistec">resistec</a>.

As this is a personal project to practice my skills, I would love to receive any comments or suggestions for improvements.

## To-Dos

- improve progress bars
- develop additional search engine scrapers (yandex, duckduckgo, etc.)
- develop module to identify family members based on facebook contact list
- add custom keyword and translation option to dork variable input 
- integrate better email enumeration service (current: holehe)
- integrate geolocation module based on social media data
- integrate darknet search modules
- develop GUI to help further sorting of final results
