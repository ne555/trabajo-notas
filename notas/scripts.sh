#Caracteres unicode
grep -RI --color='auto' -Po -n "[\x80-\xFF]" *.sql | cut -f3 -d: | sort |uniq
