#!/bin/bash

make_report_flag=0

function wrong_use() {
   echo "Try '"$0 -h"' for more information." >&2
}

function usage() {
   echo "Usage: "$0" -f file [-r]"
   echo "   -f file, specify input file"
   echo "   -r, generate a report"
}

function get_student_name() {
   echo "${1}" | sed 's/assignment_1_//g' | sed 's/.txt//g'
}

function parse_assignment_file() {
   egrep "echo -ne" $1 | cut -d "\"" -f 2 
}

function calc_num_of_points() {
   parse_assignment_file $1 | cut -d ":" -f 2 | paste -s -d+ - | bc     
}

function print_final_mark() {
   total=31
   mark=$(calc_num_of_points $1)
   echo "scale=1; ${mark}*100/${total}" | bc | sed 's/$/%/g'
}

function make_report() {
   parse_assignment_file $1 | grep -v ":1:" | sed 's/:/ [/1' | sed 's/:/] -> /1'
}

if [ -z "${1}" ]; then
 wrong_use
 exit 66
fi

while getopts "hf:r" opt; do
   case "$opt" in
   h) usage
      exit 0
     ;;
   f) file=${OPTARG}
     ;;
   r) make_report_flag=1 
     ;;

   \?) wrong_use
       exit 66
     ;;
   esac
done

if [ -z ${file} ]; then
 wrong_use
 exit 66
fi

if [ -f ${file} ]; then
 echo "Final mark for student id $(get_student_name ${file}) is $(print_final_mark ${file})"
else 
 wrong_use
 exit 66
fi

if [ ${make_report_flag} -eq 1 ]; then
 make_report ${file}
fi

exit 0
