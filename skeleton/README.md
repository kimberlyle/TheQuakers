ErrorRateFunction.R contains the function to get tau and nu for given window size. Ussage is in the comment of the file.  
MDAModelGetData test on MDA model. It creates MDAModel.RData, which contains the taus and vs for different nus and ks.  
MDAModelAnalysis.r contains the code for analysis on the models.

Results for MDAModel
--------------------
My result is quite close to Leun result.
![](errs1.png) 
![](errs2.png) 
![](errs3.png) 
![](errs4.png) 
![](errs5.png) 
![](errs6.png)
* The best nu depends on the range of tau we look at.  
The best nu is 5.4, 5.8, 6.4, 6.8, 7, 7.8 for tau in range (0.01, 1), (0.01, 0.75), (0.01, 0.5), (0.01, 0.375), (0.01, 0.25), (0.01, 0.125) accordingly.
* The models don't actually different that much from each other. The range of error rate is less than 1%.

Error Diagrams:
![](errorDiagram1.png) 
![](errorDiagram2.png)
![](errorDiagram3.png)
![](errorDiagram4.png)
![](errorDiagram5.png)
![](errorDiagram6.png)
The reason I don't draw them together is that they are so similiar that we can only see one line if put them all together.
