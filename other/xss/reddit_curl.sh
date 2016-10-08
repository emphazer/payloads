N=0;cat reddit_xss_get.txt | while read LINE; do \
  N=$((N+1)); \
  MYLINE=$(echo "$LINE" | \
    sed -e 's/\\"/\\\\\\"/g' -e 's/\([^\\]\)"/\1\\"/g' -e "s/{/\\\{/g" \
        -e "s/}/\\\}/g" -e "s/\[/\\\[/g" -e "s/]/\\\]/g"); \
  echo "echo -n \"N=$N : \""; \
  #echo "curl -k  -s \"$1?a=1$MYLINE\""; \
  echo "curl -k -o /dev/null -s -w \"%{http_code}\" \"$1?a=1$MYLINE\""; \
  echo "echo"; \
done
