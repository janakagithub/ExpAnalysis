/*
A KBase module: model_analysis_expession
This module evaluate the reconciliation of expression data against FBA
*/

module model_analysis_expession {
	/*
	A string representing a fbamodel id.
	*/
	typedef string fbamodel_id;

	/*

	/*
	A string representing a fba object.
	*/
	typedef string fba_ref;

	/*

	/*
	A string representing a expression matrix.
	*/
	typedef string expression_series_ref;
	/*
	A string representing a expression threshold.
	*/
	typedef float expression_cutoff;

	/*
	A string representing a workspace name.
	*/
	typedef string workspace_name;

	typedef structure {
		string pegId;
		float expression;
	}EachPeg;

	typedef structure {
	    string id;
	    string name;
	    float flux;
	    int gapfill;
	    int expressed;
	    list <EachPeg> pegs;
	} EachReaction;

	typedef structure {
        string pathwayName;
        int pathwayId;
	    int totalModelReactions;
	    int totalKEGGRxns;
	    int totalRxnFlux;
	    int gsrFluxPExpP;
	    int gsrFluxPExpN;
	    int gsrFluxMExpP;
	    int gsrFluxMExpM;
	    int gpRxnsFluxP;
        list<EachReaction> reaction_list;
    	} EachPathway;

	typedef structure {
			string pathwayType;
            list<EachPathway> pathways;
    	}PathwayData;


	funcdef exp_analysis(workspace_name,fbamodel_id, fba_ref, expression_series_ref, expression_cutoff) returns (PathwayData) authentication required;
};
