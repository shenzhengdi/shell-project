#!/usr/bin/perl
#!/usr/local/bin/perl

$out_filename = "realloc.rep";
$realloc_size = 512;
$size_increment = 128;
$malloc_size = 128;
$num_iters = 4800;

# Open output file
open OUTFILE, ">$out_filename" or die "Cannot create $out_filename\n";

# Calculate misc parameters

$suggested_heap_size = num_iters* ($realloc_size+$size_increment*2 )+100;
$num_blocks = $num_iters+1;
$num_ops = ($num_iters )*3 +1;
$blk = 1;

print OUTFILE "$suggested_heap_size\n"; 
print OUTFILE "$num_blocks\n";
print OUTFILE "$num_ops\n";
print OUTFILE "1\n"; 

print OUTFILE "a 0 $realloc_size\n";
print OUTFILE "a $blk $malloc_size\n";


for ($i = 1;  $i < $num_iters; $i += 1) { 
	$blk += 1;
	
	$realloc_size += $size_increment;
	
	print OUTFILE "r 0 $realloc_size\n";
	print OUTFILE "a $blk $malloc_size\n";
	
	$prevblk = $blk-1;
	print OUTFILE "f $prevblk\n";
}

$finalblk = $blk;
print OUTFILE "f $finalblk\n";
print OUTFILE "f 0";

print OUTFILE 

close OUTFILE;










