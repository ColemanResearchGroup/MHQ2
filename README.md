# Mental Health Questionnaire 2
 Code for deriving algorithmic phenotypes from the second Mental Health Questionnaire in UK Biobank, conducted in 2023. This code is contained within Davis et al, In Prep.

## Running the code

### Prerequisites

* R (tested with version 4.3.0)
    * *data.table* (tested with version 1.15.4)
    * *tidyverse* (tested with version 2.0.0)
    * *dplyr* (tested with version 1.1.4)
    * *optparse* (tested with version 1.7.5)


With R loaded in the system path:

````

Rscript Overarching.R

````

````
Usage: Overarching.R [options]

Options:
	-h, --help
		Show this help message and exit

	-i INPUT-DATA-FILE-PATH, --input-data-file-path=INPUT-DATA-FILE-PATH
		File path to a file to read as the data to process.


	-o OUTPUT-DATA-FILE-PATH, --output-data-file-path=OUTPUT-DATA-FILE-PATH
		File path to a file to write as the processed data.


	-v VARIABLES, --variables=VARIABLES
		Comma separated string of variable names to export from the processed data.
````


If Overarching.R is run without specifying variables, it will output all derived phenotypes for the second mental health questionnaire, as described in Davis et al.

Input data must contain all fields necessary to generate the variables requested - a full list of input and possible output variables is available in Overarching.R.

Individual module scripts are available as .R and as .Rmd in the scripts folder.

## Authors

* **Johan Zvrskovec** - [KCL](https://www.kcl.ac.uk/)
* **Megan Skelton** - [KCL](https://www.kcl.ac.uk/)
* **Danyang Li** - [KCL](https://www.kcl.ac.uk/)
* **Abigail ter Kuile** - [UCL](https://www.ucl.ac.uk/) 
* **Ruija Wang** - [KCL](https://www.kcl.ac.uk/)
* **Jared Maina** - [KCL](https://www.kcl.ac.uk/)
* **Helena Davies** - [Aarhus](https://international.au.dk/)
* **Zhaoying Yu** - [KCL](https://www.kcl.ac.uk/)
* **Christopher Huebel** - [Aarhus](https://international.au.dk/) 
* **Mark James Adams** - [Edinburgh](https://www.ed.ac.uk)
* **Jonathan Coleman** - [KCL](https://www.kcl.ac.uk/)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details

## Acknowledgments

This research is funded by the National Institute for Health and Care Research (NIHR) Maudsley Biomedical Research Centre (BRC). The views expressed are those of the authors and not necessarily those of the NIHR or the Department of Health and Social Care.
Primary development and testing of code was undertaken on the King's College London Computational Research, Engineering and Technology Environment (CREATE).
