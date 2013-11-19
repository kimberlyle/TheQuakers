Group: The Quakers
==========  
* Members:  
Operational Lead: Carl Shan  <a href = "https://github.com/carlshan">carlshan</a> : <shan.carl@gmail.com>  
He Ma <a href = "https://github.com/sunnymh">sunnymh</a> : <sunnymh2009@gmail.com>  
Siyang Zeng (Sunny)  <a href = "https://github.com/SunnySunnia">SunnySunnia</a> : <ho20037900@gmail.com>  
Alex Chao  <a href = "https://github.com/alexchao56">alexchao56</a> : <alexchao56@gmail.com>  
Theresa Andrasfay <a href ="https://github.com/tandrasfay">tandrasfay</a>   
David Barrera <a href = "https://github.com/jest4pun">jest4pun</a> 
Xiaorui (Sherry) Xia <a href = "https://github.com/xsherryxia">xsherryxia</a> : <x_sherry_xia@berk>
==========
## End of Semester Timeline

### Tuesday November 19
Look at the upgraded version of the MDA window length function suggested by Prof. Stark and develop an algorithm for tuning parameters and producing error diagrams.    
Assemble questions for Luen conference call. So far we are confused about his code to generate the error curve.

### Thursday November 21
Modify the algorithm and start trying with different parameters.
Figure out a way to tune the parameter. (Since there are 2 free parameters, hold one fixed and test on the other one, or changing both of them in some ways.

### Tuesday November 26
Should have a set of 'best' parameters for our window function and present our results.
If ours cannot beat any of the models, maybe try with the 'Optimization approach"

### Thursday November 28
Thanksgiving (Group members can continue to work on tasks)

### Tuesday December 3
Gather outputs from analyzers. Use these to make graphs for the final presentation. Compare different parameters found by different groups. Determine the best model to beat ETAS.

### Thursday December 5
Finalize graphs. Make information rich with final axis labels, titles, descriptions, links to data sources, etc.

### Tuesday December 10
Any last minute changes. Provide description of process to the presentors for Dec 12 Data Science Faire.

### Thursday December 12
Attend Data Science Faire 















Iteration 1 Goals:
- To create a presentation that explains the ETAS model (you can see the presentation here: https://docs.google.com/presentation/d/1yf3W22eAIX-bPgmVdqkRFfsfIgCHmbtXclF3-S92Us8/edit?usp=sharing)

* SMART Goals:  
[S]pecific  
-- We will create a Google Presentation with slides that explain the 4 parameters of the ETAS model as presented by Professor Stark.  
[M]easurable  
-- The presentation will be 4-minutes long, comprising of about 8 slides.  
[A]ttainable  
-- You can view our presentation here:   https://docs.google.com/presentation/d/1yf3W22eAIX-bPgmVdqkRFfsfIgCHmbtXclF3-S92Us8/edit?usp=sharing  
[R]elevant  
-- Understanding the ETAS model will help the class understand what the important inputs and parameters to earthquake modeling to consider.  
[T]ime-Bound  
-- We will have the presentation completed by 11:59pm 11/4/2013  

* ROADBLOCKS  
-- The biggest and most obvious roadblock we've encountered is in the process of understanding the ETAS model itself, which is mathematically complex and sophisticated.   

However, we're overcoming this roadblock through the utilization of Luen's dissertation, as well as various papers by Ogata et al. A list of resources we've used can be found in our repo: https://github.com/SunnySunnia/TheQuakers

======  
Iteration 2 Goals:  
-To plot the inter-arrival times of the earthquakes binning by magnitude, for the analyzers, as Prof. Stark suggested.  
-Study Luen's code and try to reproduce his process with both his data and our data.  
-Try to draw some initial conclusions based on what we observe while visualizing and share that with the class.  

Can find our slides here: <https://docs.google.com/presentation/d/1X4uL6_auhQZESuqVPTj9bZPF0vfhcdAE8MwNcEgtW9k/edit#slide=id.p>

* ROADBLOCKS  
-- Luen's code took us most of time while still have no clue about how he picked his parameters for his ETAS models and where is the parameter K in Ku^M embeded in his code. (We will ask Disi, who contacts with Luen, to address these questions to Luen)  
-- Being notified by the curator that they have all the data sets and relevant codes ready for use, we failed to get any other data with nice time-format but the '250' because the curators did not upload the data set, that all the codes are based on, to the data-curator repo. (Later we talked to one of the curators and found out they 'hid' the data set to their wiki instead.)  

===========
Iteration 2.5 Task:  (Nov 12th)  
-Plot the 'wait-times' of the successors of an earthquake so that the analyzers could observe and fit a window function from that.  

Plots: <https://github.com/SunnySunnia/TheQuakers/blob/master/MDA/SuccessorsTimePlot.md>  

===============
data: <https://github.com/stat157/analyzers/wiki/Data-from-Curators>  
data with NICE time format: (mag>=4,5)  
<https://www.dropbox.com/s/gttgdef4j0z02hd/CleanDataWithCorrectTime.csv>  
Nice full data set: <https://www.dropbox.com/s/tzx4qqxhh9u9iz2/DataFrame.csv>

