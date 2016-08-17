# Study drill 2: make this as short (and unreadable) as possible
from_file, to_file = ARGV
open(to_file, 'w').write(open(from_file).read)
open(from_file).close
open(to_file).close