if version < 600
	syn region	changelogFiles	start="^\s\+[+*ARD]\s" end=":\s" end="^$" contains=changelogBullet,changelogColon,changelogError keepend
else
	syn region	changelogFiles	start="^\s\+[+*ARD]\s" end=":" end="^$" contains=changelogBullet,changelogColon,changeLogFuncs,changelogError keepend
endif

syn match	changelogBullet	contained "^\s\+[+*ARD]\s" contains=changelogError
