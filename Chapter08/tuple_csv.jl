fname = "savetuple.csv"
csvfile = open(fname,"w")
# writing headers:
write(csvfile, "ColName A, ColName B, ColName C\n")
for i = 1:10
	tup(i) = tuple(rand(Float64,3)...)
	write(csvfile, join(tup(i),","), "\n")
end
close(csvfile)