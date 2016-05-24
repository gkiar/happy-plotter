## 3D Fiber Visualization

This script provides a 3D interactive plot of fiber streamlines for manipulation
and optionally saves the images to disk. It can either be called directly using
a prompt from the commandline or imported into a python session and called inline
in your Python script.


#### Calling from Commandline

The expected format of the fibers is a *numpy* `.npz` file which contains solely
the streamlines as produced by DiPy (i.e. a list of lists of points along each
fiber). Without the `-o` flag an interactive window will pop up and you can manipulate
the fibers until you are happy and then close it. With the `-o` flag, when you close
your window the image in its final state will be saved to the desired filename.

Using the files in this directory, the code has been run like this:
```
python viz_3d_fibers.py fibers.npz -o fibers.png
```

#### Calling from within a script

In your python script you can call it much like you would expect: you simply import
the library and then call the desired function. An example of using this is
shown here:

```{python}
from viz_3d_fibers import visualize

fibers =   # your fibers here....
outf =     # your outfile name here....

if outf is not None:
    visualize(fibers, outf)
else:
    visualize(fibers)

```


P.s. The fiber file attached is heavily downsampled in order to reduce the time
of computation for the demo and the amount of data I needed in the repository.
