img=newArray("image","names","without",".tiff");
for(i = 0; i < img.length; i++) {
	open(img[i] +".tiff");
selectImage(img[i] +".tiff");
run("Duplicate...", "title=temp-DNA.tiff duplicate channels=11");
run("16-bit");
setOption("BlackBackground", true);
setAutoThreshold("Otsu dark");
run("Convert to Mask");
run("Despeckle");
run("Watershed");
run("Analyze Particles...", "size=4-Infinity show=[Count Masks] display summarize");
saveAs("Tiff", "/path/to/masks/folder/" + img[i] + ".tiff");
run("Close All");
}
