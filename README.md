# Evolving Worldviews: Factors Influencing the Shifting Perspectives of American Adults on Abortion

## Overview
This paper explores the public opinions of American adults in 2006 and 2016 on varying reasons a woman may want to obtain a legal abortion. Various factors such as age group, sex, religious beliefs, and influential movements/law changes are discussed. Respondents were instructed to choose Yes(1) or No(2) after being given prompts to convey their perspectives on if the following reasons were valid:
1. If she became pregnant as a result of rape?
2. If the woman's own health is seriously endangered by the pregnancy?
3. If the family has a very low income and cannot afford any more children?
4. If the woman wants it for any reason?
This repo provides an analysis of how the perspectives on reasons for abortion (eg. low income household, rape, endangered health, and any reason) have evolved from 2006 to 2016. The impact of age, gender, public movements, changing laws, and religious views on public opinion is discussed.

*"Please be advised: This paper includes in-depth discussions on abortion, a topic that may be distressing to some readers."*

## File Structure

The repo is structured as:

-   `inputs` contains details about LLM chat interactions and sketches.
-   `outputs/data` contains the cleaned data as obtained from GSS Data Explorer.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the finalized paper. 
-   `scripts` contains the R scripts used to simulate, download, clean, and test the data.

## Replication 
1. Follow the steps in the GSS Data section below to retrieve the raw data.
2. Run `scripts/02-data_cleaning.R` and `scripts/02a-data_cleaning.R` to generate cleaned data
3. Render `outputs/paper/abortion.qmd` to generate the PDF of the paper

## GSS Data
Due to the file’s large size and Github limitations, we were unable to upload the raw data retrieved from the GSS Data Explorer website and the converted CSV version of the raw data to this repository. In order to run the files in the scripts folder (more specifically, the `01-download_data.R file`), attend to the following instructions:
1. Visit the website https://gssdataexplorer.norc.org/gss_data and download the STATA Format Download file.
2. Once a file named GSS_stata.zip is finished downloading, unzip the file. There should be two PDF files, one TXT file, and a DTA file.
3. Locate the DTA file and rename it to GSS7218_R1.dta. Move it to the `inputs` folder so that the path is "inputs/data/GSS7218_R1.dta"

## Statement on LLM usage
No LLMs were used in the research, replication, or writing of this paper.
