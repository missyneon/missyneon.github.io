############################################################################################################################################
############ Main Program combines South Wales crime data from February 2020 to May 2021 into one csv file ###########################
############################################################################################################################################

# The os module provides functions for interacting with the operating system
import os
 
 # The glob module generates lists of files whose filenames matching given patterns
import glob

# The pandas module is for data manipulation and analysis by offering data structures and operations for manipulating numerical tables and time series
import pandas as pd 



def main():      
    # Set path to output folder for merged csv file
    inpath = "C:/Users/steph/Desktop/CIS/MScProject/data/data/**/"
    outpath = "C:/Users/steph/Desktop/CIS/MScProject/data/data/"

    # Match csv files by pattern into a list
    all_files_2018 = glob.glob(os.path.join(inpath, "2018-*.csv"), recursive = True)
    all_files_2019 = glob.glob(os.path.join(inpath, "2019-*.csv"), recursive = True)
    all_files_2020 = glob.glob(os.path.join(inpath, "2020-*.csv"), recursive = True)
    all_files_2021 = glob.glob(os.path.join(inpath, "2021-*.csv"), recursive = True)

    ## Combine all files in the all_files list and export as CSV
     # dataframe for each file
    df_from_each_file_2018 = (pd.read_csv(f,sep=',') for f in all_files_2018)
    df_from_each_file_2019 = (pd.read_csv(f,sep=',') for f in all_files_2019)
    df_from_each_file_2020 = (pd.read_csv(f,sep=',') for f in all_files_2020)
    df_from_each_file_2021 = (pd.read_csv(f,sep=',') for f in all_files_2021)
      
     # merged dataframe from each file's dataframe
    df_merged_2018 = pd.concat(df_from_each_file_2018, ignore_index = True)
    df_merged_2019 = pd.concat(df_from_each_file_2019, ignore_index = True)
    df_merged_2020 = pd.concat(df_from_each_file_2020, ignore_index = True)
    df_merged_2021 = pd.concat(df_from_each_file_2021, ignore_index = True)

     # export merged dataframe to csv
    df_merged_2018.to_csv(outpath+'2018_wales_crime_data.csv')
    df_merged_2019.to_csv(outpath+'2019_wales_crime_data.csv')
    df_merged_2020.to_csv(outpath+'2020_wales_crime_data.csv')
    df_merged_2021.to_csv(outpath+'2021_wales_crime_data.csv')

    

# Call the main function
main()



