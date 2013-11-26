We want to try this really simple model: pick a cutoff time for the successors that we want to cover by our alarm. We pick the cutoff time by looking at event times of the successors of earthquakes within a range as the data and find a specific percentile of the data. The percentile will be our length of alarm window for earthquakes in that range.  

For example, we found the 90-percentiles of the successor-times of earthquakes with magnitude from 3 to 7.5 with bin size 0.1:   
![](90Quantile.jpeg)  
