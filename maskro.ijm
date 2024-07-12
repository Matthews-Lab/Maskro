path=getDirectory("/Volumes/sb3222/home/Exp1/img/");
print(path)

// Get the list of files in the current directory
img = getFileList(path);

for(i = 0; i < img.length; i++) {
	print(img[i]);
	open(path + img[i]);
selectImage(img[i]);
run("Duplicate...", "title=temp-DNA.tiff duplicate channels=11");
run("16-bit");
setOption("BlackBackground", true);
setAutoThreshold("Mean dark");
run("Convert to Mask");
run("Despeckle");
run("Watershed");
run("Analyze Particles...", "size=22-Infinity show=[Count Masks] display summarize");
saveAs("Tiff", "/Volumes/sb3222/home/Exp1/masks_fiji_mean_22/" + img[i]);
run("Close All");
}
