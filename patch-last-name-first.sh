#!/bin/bash

# Изменение отображения ФИО - чтобы было ФИО, а не ИОФ
# Заменил
# $full = '<span class="NAME" dir="auto" translate="no">' . preg_replace('/\/([^\/]*)\//', '<span class="SURN">$1</span>', e($full)) . '</span>';
# на
# $full = '<span class="NAME" dir="auto" translate="no">' . preg_replace('/([^\/]*)\/([^\/]*)\//', '<span class="SURN">$2</span> $1', e($full)) . '</span>';

# Edit the Individual.php file

# Define from_line using a heredoc without escaping special characters.
from_line=$(cat <<'EOF'
$full = '<span class="NAME" dir="auto" translate="no">' . preg_replace('/\/([^\/]*)\//', '<span class="SURN">$1</span>', e($full)) . '</span>';
EOF
)

# Define to_line using a heredoc similarly.
to_line=$(cat <<'EOF'
$full = '<span class="NAME" dir="auto" translate="no">' . preg_replace('/([^\/]*)\/([^\/]*)/', '<span class="SURN">$2</span> $1', e($full)) . '</span>';
EOF
)

file="/var/www/webtrees/app/Individual.php"  # The file to edit in place

# Get the directory where this script is located
script_dir=$(dirname "$(realpath "$0")")
"$script_dir/replace.sh" "$from_line" "$to_line" "$file"

