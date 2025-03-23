" Geant4 text geometry input file syntax
if exists("b:current_syntax")
  finish
endif

syn match Comment "//.*$" 

syn keyword Statement isot elem elem_from_isot mate mixt 
syn keyword Statement mixt_by_weight mixt_by_natoms mixt_by_volume
syn keyword Statement solid color colour rotm vis check_overlaps
syn keyword Statement div_width div_ndiv div_ndiv_width repl 
syn keyword Statement volu volu_assembly place place_param place_assembly
syn match Statement "^:p " 

syn keyword Type BOX TUBE TUBS CONE CONS TRD PARA TRAP SPHERE ORB TORUS
syn keyword Type POLYCONE GENERICPOLYCONE POLYHEDRA ELLIPTICALTUBE
syn keyword Type ELLIPSOID ELLIPTICALCONE HYPE TET 
syn keyword Type TWISTEDBOX TWISTEDTRAP TWISTEDTRD TWISTEDTUBS
syn keyword Type MULTIUNION UNION SUBTRACTION INTERSECTION
syn keyword Type SCALED TESSELLATED EXTRUDED

syn keyword Type LINEAR LINEAR_X LINEAR_Y LINEAR_Z CIRCLE 
syn keyword Type SQUARE SQUARE_XZ SQUARE_XY SQUARE_YZ

syn match PreProc "^#include"

syn keyword Constant ON OFF TRUE FALSE

syn keyword Constant G4_H
syn keyword Constant G4_He
syn keyword Constant G4_Li
syn keyword Constant G4_Be
syn keyword Constant G4_B
syn keyword Constant G4_C
syn keyword Constant G4_N
syn keyword Constant G4_O
syn keyword Constant G4_F
syn keyword Constant G4_Ne
syn keyword Constant G4_Na
syn keyword Constant G4_Mg
syn keyword Constant G4_Al
syn keyword Constant G4_Si
syn keyword Constant G4_P
syn keyword Constant G4_S
syn keyword Constant G4_Cl
syn keyword Constant G4_Ar
syn keyword Constant G4_K
syn keyword Constant G4_Ca
syn keyword Constant G4_Sc
syn keyword Constant G4_Ti
syn keyword Constant G4_V
syn keyword Constant G4_Cr
syn keyword Constant G4_Mn
syn keyword Constant G4_Fe
syn keyword Constant G4_Co
syn keyword Constant G4_Ni
syn keyword Constant G4_Cu
syn keyword Constant G4_Zn
syn keyword Constant G4_Ga
syn keyword Constant G4_Ge
syn keyword Constant G4_As
syn keyword Constant G4_Se
syn keyword Constant G4_Br
syn keyword Constant G4_Kr
syn keyword Constant G4_Rb
syn keyword Constant G4_Sr
syn keyword Constant G4_Y
syn keyword Constant G4_Zr
syn keyword Constant G4_Nb
syn keyword Constant G4_Mo
syn keyword Constant G4_Tc
syn keyword Constant G4_Ru
syn keyword Constant G4_Rh
syn keyword Constant G4_Pd
syn keyword Constant G4_Ag
syn keyword Constant G4_Cd
syn keyword Constant G4_In
syn keyword Constant G4_Sn
syn keyword Constant G4_Sb
syn keyword Constant G4_Te
syn keyword Constant G4_I
syn keyword Constant G4_Xe
syn keyword Constant G4_Cs
syn keyword Constant G4_Ba
syn keyword Constant G4_La
syn keyword Constant G4_Ce
syn keyword Constant G4_Pr
syn keyword Constant G4_Nd
syn keyword Constant G4_Pm
syn keyword Constant G4_Sm
syn keyword Constant G4_Eu
syn keyword Constant G4_Gd
syn keyword Constant G4_Tb
syn keyword Constant G4_Dy
syn keyword Constant G4_Ho
syn keyword Constant G4_Er
syn keyword Constant G4_Tm
syn keyword Constant G4_Yb
syn keyword Constant G4_Lu
syn keyword Constant G4_Hf
syn keyword Constant G4_Ta
syn keyword Constant G4_W
syn keyword Constant G4_Re
syn keyword Constant G4_Os
syn keyword Constant G4_Ir
syn keyword Constant G4_Pt
syn keyword Constant G4_Au
syn keyword Constant G4_Hg
syn keyword Constant G4_Tl
syn keyword Constant G4_Pb
syn keyword Constant G4_Bi
syn keyword Constant G4_Po
syn keyword Constant G4_At
syn keyword Constant G4_Rn
syn keyword Constant G4_Fr
syn keyword Constant G4_Ra
syn keyword Constant G4_Ac
syn keyword Constant G4_Th
syn keyword Constant G4_Pa
syn keyword Constant G4_U
syn keyword Constant G4_Np
syn keyword Constant G4_Pu
syn keyword Constant G4_Am
syn keyword Constant G4_Cm
syn keyword Constant G4_Bk
syn keyword Constant G4_Cf
syn match Constant "G4_A-150_TISSUE"
syn keyword Constant G4_ACETONE
syn keyword Constant G4_ACETYLENE
syn keyword Constant G4_ADENINE
syn keyword Constant G4_ADIPOSE_TISSUE_ICRP
syn keyword Constant G4_AIR
syn keyword Constant G4_ALANINE
syn keyword Constant G4_ALUMINUM_OXIDE
syn keyword Constant G4_AMBER
syn keyword Constant G4_AMMONIA
syn keyword Constant G4_ANILINE
syn keyword Constant G4_ANTHRACENE
syn match Constant "G4_B-100_BONE"
syn keyword Constant G4_BAKELITE
syn keyword Constant G4_BARIUM_FLUORIDE
syn keyword Constant G4_BARIUM_SULFATE
syn keyword Constant G4_BENZENE
syn keyword Constant G4_BERYLLIUM_OXIDE
syn keyword Constant G4_BGO
syn keyword Constant G4_BLOOD_ICRP
syn keyword Constant G4_BONE_COMPACT_ICRU
syn keyword Constant G4_BONE_CORTICAL_ICRP
syn keyword Constant G4_BORON_CARBIDE
syn keyword Constant G4_BORON_OXIDE
syn keyword Constant G4_BRAIN_ICRP
syn keyword Constant G4_BUTANE
syn match Constant "G4_N-BUTYL_ALCOHOL"
syn keyword Constant G4_C-552
syn keyword Constant G4_CADMIUM_TELLURIDE
syn keyword Constant G4_CADMIUM_TUNGSTATE
syn keyword Constant G4_CALCIUM_CARBONATE
syn keyword Constant G4_CALCIUM_FLUORIDE
syn keyword Constant G4_CALCIUM_OXIDE
syn keyword Constant G4_CALCIUM_SULFATE
syn keyword Constant G4_CALCIUM_TUNGSTATE
syn keyword Constant G4_CARBON_DIOXIDE
syn keyword Constant G4_CARBON_TETRACHLORIDE
syn keyword Constant G4_CELLULOSE_CELLOPHANE
syn keyword Constant G4_CELLULOSE_BUTYRATE
syn keyword Constant G4_CELLULOSE_NITRATE
syn keyword Constant G4_CERIC_SULFATE
syn keyword Constant G4_CESIUM_FLUORIDE
syn keyword Constant G4_CESIUM_IODIDE
syn keyword Constant G4_CHLOROBENZENE
syn keyword Constant G4_CHLOROFORM
syn keyword Constant G4_CONCRETE
syn keyword Constant G4_CYCLOHEXANE
syn keyword Constant G4_1,2-DICHLOROBENZENE
syn keyword Constant G4_DICHLORODIETHYL_ETHER
syn keyword Constant G4_1,2-DICHLOROETHANE
syn keyword Constant G4_DIETHYL_ETHER
syn keyword Constant G4_N,N-DIMETHYL_FORMAMIDE
syn keyword Constant G4_DIMETHYL_SULFOXIDE
syn keyword Constant G4_ETHANE
syn keyword Constant G4_ETHYL_ALCOHOL
syn keyword Constant G4_ETHYL_CELLULOSE
syn keyword Constant G4_ETHYLENE
syn keyword Constant G4_EYE_LENS_ICRP
syn keyword Constant G4_FERRIC_OXIDE
syn keyword Constant G4_FERROBORIDE
syn keyword Constant G4_FERROUS_OXIDE
syn keyword Constant G4_FERROUS_SULFATE
syn match Constant "G4_FREON-12"
syn match Constant "G4_FREON-12B2"
syn match Constant "G4_FREON-13"
syn match Constant "G4_FREON-13B1"
syn match Constant "G4_FREON-13I1"
syn keyword Constant G4_GADOLINIUM_OXYSULFIDE
syn keyword Constant G4_GALLIUM_ARSENIDE
syn keyword Constant G4_GEL_PHOTO_EMULSION
syn keyword Constant G4_Pyrex_Glass
syn keyword Constant G4_GLASS_LEAD
syn keyword Constant G4_GLASS_PLATE
syn keyword Constant G4_GLUTAMINE
syn keyword Constant G4_GLYCEROL
syn keyword Constant G4_GUANINE
syn keyword Constant G4_GYPSUM
syn match Constant "G4_N-HEPTANE"
syn match Constant "G4_N-HEXANE"
syn keyword Constant G4_KAPTON
syn keyword Constant G4_LANTHANUM_OXYBROMIDE
syn keyword Constant G4_LANTHANUM_OXYSULFIDE
syn keyword Constant G4_LEAD_OXIDE
syn keyword Constant G4_LITHIUM_AMIDE
syn keyword Constant G4_LITHIUM_CARBONATE
syn keyword Constant G4_LITHIUM_FLUORIDE
syn keyword Constant G4_LITHIUM_HYDRIDE
syn keyword Constant G4_LITHIUM_IODIDE
syn keyword Constant G4_LITHIUM_OXIDE
syn keyword Constant G4_LITHIUM_TETRABORATE
syn keyword Constant G4_LUNG_ICRP
syn keyword Constant G4_M3_WAX
syn keyword Constant G4_MAGNESIUM_CARBONATE
syn keyword Constant G4_MAGNESIUM_FLUORIDE
syn keyword Constant G4_MAGNESIUM_OXIDE
syn keyword Constant G4_MAGNESIUM_TETRABORATE
syn keyword Constant G4_MERCURIC_IODIDE
syn keyword Constant G4_METHANE
syn keyword Constant G4_METHANOL
syn keyword Constant G4_MIX_D_WAX
syn keyword Constant G4_MS20_TISSUE
syn keyword Constant G4_MUSCLE_SKELETAL_ICRP
syn keyword Constant G4_MUSCLE_STRIATED_ICRU
syn keyword Constant G4_MUSCLE_WITH_SUCROSE
syn keyword Constant G4_MUSCLE_WITHOUT_SUCROSE
syn keyword Constant G4_NAPHTHALENE
syn keyword Constant G4_NITROBENZENE
syn keyword Constant G4_NITROUS_OXIDE
syn match Constant "G4_NYLON-8062"
syn match Constant "G4_NYLON-6-6"
syn match Constant "G4_NYLON-6-10"
syn match Constant "G4_NYLON-11_RILSAN"
syn keyword Constant G4_OCTANE
syn keyword Constant G4_PARAFFIN
syn match Constant "G4_N-PENTANE"
syn keyword Constant G4_PHOTO_EMULSION
syn keyword Constant G4_PLASTIC_SC_VINYLTOLUENE
syn keyword Constant G4_PLUTONIUM_DIOXIDE
syn keyword Constant G4_POLYACRYLONITRILE
syn keyword Constant G4_POLYCARBONATE
syn keyword Constant G4_POLYCHLOROSTYRENE
syn keyword Constant G4_POLYETHYLENE
syn keyword Constant G4_MYLAR
syn keyword Constant G4_PLEXIGLASS
syn keyword Constant G4_POLYOXYMETHYLENE
syn keyword Constant G4_POLYPROPYLENE
syn keyword Constant G4_POLYSTYRENE
syn keyword Constant G4_TEFLON
syn keyword Constant G4_POLYTRIFLUOROCHLOROETHYLENE
syn keyword Constant G4_POLYVINYL_ACETATE
syn keyword Constant G4_POLYVINYL_ALCOHOL
syn keyword Constant G4_POLYVINYL_BUTYRAL
syn keyword Constant G4_POLYVINYL_CHLORIDE
syn keyword Constant G4_POLYVINYLIDENE_CHLORIDE
syn keyword Constant G4_POLYVINYLIDENE_FLUORIDE
syn keyword Constant G4_POLYVINYL_PYRROLIDONE
syn keyword Constant G4_POTASSIUM_IODIDE
syn keyword Constant G4_POTASSIUM_OXIDE
syn keyword Constant G4_PROPANE
syn keyword Constant G4_lPROPANE
syn match Constant "G4_N-PROPYL_ALCOHOL"
syn keyword Constant G4_PYRIDINE
syn keyword Constant G4_RUBBER_BUTYL
syn keyword Constant G4_RUBBER_NATURAL
syn keyword Constant G4_RUBBER_NEOPRENE
syn keyword Constant G4_SILICON_DIOXIDE
syn keyword Constant G4_SILVER_BROMIDE
syn keyword Constant G4_SILVER_CHLORIDE
syn keyword Constant G4_SILVER_HALIDES
syn keyword Constant G4_SILVER_IODIDE
syn keyword Constant G4_SKIN_ICRP
syn keyword Constant G4_SODIUM_CARBONATE
syn keyword Constant G4_SODIUM_IODIDE
syn keyword Constant G4_SODIUM_MONOXIDE
syn keyword Constant G4_SODIUM_NITRATE
syn keyword Constant G4_STILBENE
syn keyword Constant G4_SUCROSE
syn keyword Constant G4_TERPHENYL
syn keyword Constant G4_TESTIS_ICRP
syn keyword Constant G4_TETRACHLOROETHYLENE
syn keyword Constant G4_THALLIUM_CHLORIDE
syn keyword Constant G4_TISSUE_SOFT_ICRP
syn keyword Constant G4_TISSUE_SOFT_ICRU-4
syn keyword Constant G4_TISSUE-METHANE
syn keyword Constant G4_TISSUE-PROPANE
syn keyword Constant G4_TITANIUM_DIOXIDE
syn keyword Constant G4_TOLUENE
syn keyword Constant G4_TRICHLOROETHYLENE
syn keyword Constant G4_TRIETHYL_PHOSPHATE
syn keyword Constant G4_TUNGSTEN_HEXAFLUORIDE
syn keyword Constant G4_URANIUM_DICARBIDE
syn keyword Constant G4_URANIUM_MONOCARBIDE
syn keyword Constant G4_URANIUM_OXIDE
syn keyword Constant G4_UREA
syn keyword Constant G4_VALINE
syn keyword Constant G4_VITON
syn keyword Constant G4_WATER
syn keyword Constant G4_WATER_VAPOR
syn keyword Constant G4_XYLENE
syn keyword Constant G4_GRAPHITE
syn keyword Constant G4_lH2
syn keyword Constant G4_lN2
syn keyword Constant G4_lO2
syn keyword Constant G4_lAr
syn keyword Constant G4_lBr
syn keyword Constant G4_lKr
syn keyword Constant G4_lXe
syn keyword Constant G4_PbWO4
syn keyword Constant G4_Galactic
syn keyword Constant G4_GRAPHITE_POROUS
syn keyword Constant G4_LUCITE
syn keyword Constant G4_BRASS
syn keyword Constant G4_BRONZE
syn match Constant "G4_STAINLESS-STEEL"
syn keyword Constant G4_CR39
syn keyword Constant G4_OCTADECANOL
syn keyword Constant G4_KEVLAR
syn keyword Constant G4_DACRON
syn keyword Constant G4_NEOPRENE
syn keyword Constant G4_CYTOSINE
syn keyword Constant G4_THYMINE
syn keyword Constant G4_URACIL
syn keyword Constant G4_DNA_ADENINE
syn keyword Constant G4_DNA_GUANINE
syn keyword Constant G4_DNA_CYTOSINE
syn keyword Constant G4_DNA_THYMINE
syn keyword Constant G4_DNA_URACIL
syn keyword Constant G4_DNA_ADENOSINE
syn keyword Constant G4_DNA_GUANOSINE
syn keyword Constant G4_DNA_CYTIDINE
syn keyword Constant G4_DNA_URIDINE
syn keyword Constant G4_DNA_METHYLURIDINE
syn keyword Constant G4_DNA_MONOPHOSPHATE
syn keyword Constant G4_DNA_A
syn keyword Constant G4_DNA_G
syn keyword Constant G4_DNA_C
syn keyword Constant G4_DNA_U
syn keyword Constant G4_DNA_MU
