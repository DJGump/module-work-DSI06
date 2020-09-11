This README.txt file was generated on 5 November 2019 by Xing Meng
Copyright 2019. California Institute of Technology. All Rights Reserved.

================================================================================
                                GENERAL INFORMATION
================================================================================
Title of Dataset: Companion dataset for "Thermosphere-Ionosphere Modeling With 
                  Forecastable Inputs: Case Study of the June 2012 High Speed 
                  Stream Geomagnetic Storm"

Author information: Xing Meng, Anthony J. Mannucci, Olga P. Verkhoglyadova, 
                    Bruce T. Tsurutani, Aaron J. Ridley, and Ja-Soon Shim
                    

Contact information
Primary Contact: Xing Meng
		 Jet Propulsion Laboratory
                 California Institute of Technology
		 Pasadena, CA, USA
                 xing.meng@jpl.nasa.gov
                 
Alternative Contacts: Tony Mannucci
		      Jet Propulsion Laboratory
		      California Institute of Technology
		      Pasadena, CA, USA		                            
		      anthony.j.mannucci@jpl.nasa.gov

                      Olga Verkhoglyadova
		      Jet Propulsion Laboratory
		      California Institute of Technology
		      Pasadena, CA, USA
                      olga.verkhoglyadova@jpl.nasa.gov

Funding sources and sponsorship:
This work was performed at the Jet Propulsion Laboratory, California Institute
of Technology, under a contract with the NASA, and sponsored by Living With A 
Star Targeted Research and Technology NASA/NSF Partnership for Collaborative 
Space Weather Modeling Program. The computing resources were provided by the 
NASA High-End Computing Program through the NASA Advanced Supercomputing 
Division at Ames Research Center.


================================================================================
                                REPOSITORY OVERVIEW
================================================================================
Repository structure is as follows.

Dataset
 ↳GITM_201206_Original
   Contains outputs from the original GITM run for the June 2012 CIR/HSS storm
   under "forecastable-mode".
 ↳GITM_201206_Test1
   Contains outputs from GITM Test 1: driven by a quiet solar wind and the actual 
   F10.7 index.  
 ↳GITM_201206_Test2
   Contains outputs from GITM Test 2: driven by a quiet F10.7 index and the actual 
   solar wind conditions.
 ↳GITM_201206_Test3
   Contains outputs from GITM Test 3: driven by a quiet solar wind and a quiet
   F10.7 index.
 ↳GITM_201206_Test4
   Contains outputs from GITM Test 4: driven by the actual solar wind conditions 
   and FISM.
 ↳README.txt

================================================================================
                            DATA-SPECIFIC INFORMATION
================================================================================
The outputs from the GITM run and tests contain three types of files:

- 2DTEC_tYYMMDD_HHMMSS.bin
  Global vertical TEC on a 2D grid at YYMMDD_HH:MM:SS, in IDL binary format.
  Variable List: Longitude[rad], Latitude[rad], Altitude[m], Solar Zenith 
                 Angle[deg], Vertical TEC[TECU].

- 3DMAG_tYYMMDD_HHMMSS.bin
  Magnetic field on a 3D grid at YYMMDD_HH:MM:SS, in IDL binary format.
  Variable List: Longitude[rad], Latitude[rad], Altitude[m], Magnetic Latitude[deg], 
                 Magnetic Longitude[deg], B.F. East[T], B.F. North[T], 
 		 B.F. Vertical[T], B.F. Magnitude[T].

- 3DUSR_tYYMMDD_HHMMSS.bin
  Neutral and ion states on a 3D grid at YYMMDD_HH:MM:SS, in IDL binary format.
  Variable List: Longitude[rad], Latitude[rad], Altitude[m], Neutral Density[kg/m3], 
                 O Density[m-3], O2 Density[m-3], N2 Density[m-3], N Density[m-3], 
                 NO Density[m-3], Neutral Temperature[K], Neutral Velocity(east)[m/s], 
      		 Neutral Velocity(north)[m/s], Neutral Velocity(up)[m/s], 
 		 Electron Density[m-3], O+ Density[m-3], Ion Velocity(east)[m/s],
		 Ion Velocity(north)[m/s], Ion Velocity(up)[m/s], Potential[V], 
                 E Field(east)[V/m], E Field(north)[V/m], E Field(up)[V/m], 
		 EUV Heating, Photoelectron Heating, Joule Heating, Auroral Heating,
                 Chemical Heating, Conduction, O Cooling, NO Cooling, CO2 Cooling,
		 Specific Heat, Photoionization Rate for O, Chemical reaction rate
 		 for O+ + O2, Chemical reaction rate for O+ + N2.

Note: Due to the large file size, only the 3DMAG_tYYMMDD_HHMMSS.bin and 
      3DUSR_tYYMMDD_HHMMSS.bin files used for generating the figures in the paper are 
      available. The GITM_201206_Test4 folder does not contain 3DMAG_tYYMMDD_HHMMSS.bin 
      and 3DUSR_tYYMMDD_HHMMSS.bin files.
      


