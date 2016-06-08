#!/bin/bash

########-1-#######-2-#######-3-#######-4-#######-5-#######-6-#######-7-#######-8
###-------------------------Configuration & Constants------------------------###
########-1-#######-2-#######-3-#######-4-#######-5-#######-6-#######-7-#######-8

full_length_border="########-1-#######-2-#######-3-#######-4-#######-5-#######-6-#######-7-#######-8"
### The length is computed, so feel free to change the bookend string as prefered -- but short...
bookend_string="###"
bookend_string_length=${#bookend_string}
### Made this 40 characters, since it should only have to be half a page width
line='----------------------------------------'

target_character_width="80"

########-1-#######-2-#######-3-#######-4-#######-5-#######-6-#######-7-#######-8
###------------------------------Initialization------------------------------###
########-1-#######-2-#######-3-#######-4-#######-5-#######-6-#######-7-#######-8



comment_string=$1
comment_string_length=${#comment_string}

### The normal case of an 80 character line, we lose twice the lenght of the bookends, so we subtract
# that from the total width, then subtract the length of the comment, then split the difference.  If its odd
# we add the extra space to the left side

let "remaining_space_1 = $target_character_width - (( 2 * $bookend_string_length )) - $comment_string_length"
let "remaining_space_2 = $remaining_space_1 / 2 "

if [ $((comment_string_length%2)) -eq 0 ]; then
	length_adjustment=0
else
	length_adjustment=1
fi

let "prefix_length = $remaining_space_2 + $length_adjustment"
let "postfix_length = $remaining_space_2"

echo "$full_length_border"
printf "%s%s%s%s%s\n" $bookend_string "${line::prefix_length}" "$comment_string" "${line::postfix_length}" $bookend_string
echo "$full_length_border"


