#!/bin/bash

#Run all the refer-parser2 prep
#Arguments: dataset splitBy num_workers
#Use example: ./run_all.sh sunspot boulder 4

#Parse expressions using Stanford Parser
python parse_sents.py --dataset $1 --splitBy $2 --num_workers $3

#Parse expressions using Vicente's R1-R7 attributes
python parse_atts.py --dataset $1 --splitBy $2

#Visualize decomposed attributes
python write_atts_html.py --dataset $1 --splitBy $2

#Parse expression using SENNA parser
python senna_sents.py --dataset $1 --splitBy $2 --num_workers $3

#Chunk expressions into phrase structures
python chunk_sents.py --dataset $1 --splitBy $2

#Analyze the phrase structures from the chunking results
python analyze_chunk.py --dataset $1 --splitBy $2

#Visualize the phrase structures
python write_chunk_html.py --dataset $1 --splitBy $2  
