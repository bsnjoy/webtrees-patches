#!/bin/bash

# Define from_line using a heredoc without escaping special characters.
from_line=$(cat <<'EOF'
'Given names' => 'Имя (имена)',
EOF
)

# Define to_line using a heredoc similarly.
to_line=$(cat <<'EOF'
'Given names' => 'Имя Отчество',
EOF
)

file="/var/www/webtrees/resources/lang/ru/messages.php"  # The file to edit in place

./replace.sh "$from_line" "$to_line" "$file"

