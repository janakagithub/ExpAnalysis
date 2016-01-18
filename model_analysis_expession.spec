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
	typedef string fba_id;

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

 	/*
		Reference to expression data
		@id ws KBaseFeatureValues.ExpressionMatrix
	*/
        typedef string expression_matrix_ref;

	/*
		Reference to metabolic model
		@id ws KBaseFBA.FBAModel
	*/
    	 typedef string fbamodel_ref;

         /*
		Reference to a FBA object
		@id ws KBaseFBA.FBA
	  */
    	 typedef string fba_ref;



       typedef structure {
	    string pegId;
	    float expression;
	} FBAPathwayAnalysisFeature;

	typedef structure {
	    string id;
	    string name;
	    float flux;
	    int gapfill;
	    int expressed;
	    list <FBAPathwayAnalysisFeature> pegs;
	} FBAPathwayAnalysisReaction;

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
           list<FBAPathwayAnalysisReaction> reaction_list;
        } FBAPathwayAnalysisPathway;

	typedef structure {
	    string pathwayType;
           expression_matrix_ref expression_matrix_ref;
           string expression_condition;
           fbamodel_ref fbamodel_ref;
           fba_ref fba_ref;
           list<FBAPathwayAnalysisPathway> pathways;
        } FBAPathwayAnalysis;


	funcdef exp_analysis(workspace_name,fbamodel_id, fba_id, expression_series_ref, expression_cutoff) returns (FBAPathwayAnalysis) authentication required;
};
