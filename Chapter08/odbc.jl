using ODBC, Dates
ODBC.DSN("pubsODBC", <user>,<password>)
	# Connection Data Source: pubsODBC
	# pubsODBC Connection Number: 1
	# Contains resultset? No
results = ODBC.query(dsn, "select * from titles")
# elapsed time: 0.189238158 seconds
# 18x10 DataFrame
# | Row | title_id |
# |-----|----------|
# | 1   | "BU1032" |
# | 2   | "BU1111" |
# | 3   | "BU2075" |
# | 4   | "BU7832" |
# | 5   | "MC2222" |
# | 6   | "MC3021" |
# ⋮
# | 12  | "PS2091" |
# | 13  | "PS2106" |
# | 14  | "PS3333" |
# | 15  | "PS7777" |
# | 16  | "TC3218" |
# | 17  | "TC4203" |
# | 18  | "TC7777" |

# | Row | title                                                             |
# |-----|-------------------------------------------------------------------|
# | 1   | "The Busy Executive's Database Guide"                             |
# | 2   | "Cooking with Computers: Surreptitious Balance Sheets"            |
# | 3   | "You Can Combat Computer Stress!"                                 |
# | 4   | "Straight Talk About Computers"                                   |
# | 5   | "Silicon Valley Gastronomic Treats"                               |
# | 6   | "The Gourmet Microwave"                                           |
# ⋮
#  Row | _type          | pub_id | price | advance | royalty | ytd_sales |
# -----|----------------|--------|-------|---------|---------|-----------|
#  1   | "business    " | "1389" | 19.99 | 5000.0  | 10      | 4095      |
#  2   | "business    " | "1389" | 11.95 | 5000.0  | 10      | 3876      |
#  3   | "business    " | "0736" | 2.99  | 10125.0 | 24      | 18722     |
#  4   | "business    " | "1389" | 19.99 | 5000.0  | 10      | 4095      |
#  5   | "mod_cook    " | "0877" | 19.99 | 0.0     | 12      | 2032      |
#  6   | "mod_cook    " | "0877" | 2.99  | 15000.0 | 24      | 22246     |
# fname = "books.dat"
# ODBC.query(dsn, "select * from titles", file=fname, delim = '\t')

# updates:
updsql = "update titles set type = 'psychology' where title_id='BU1032'"
stmt = ODBC.prepare(dsn, updsql)
ODBC.execute!(stmt)

ODBC.listdrivers()
ODBC.listdsns()