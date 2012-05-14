lines1 = open(ARGV[0]).readlines
lines2 = open(ARGV[1]).readlines

print (lines1 - lines2).join
