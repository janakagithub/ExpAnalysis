
package us.kbase.modelanalysisexpession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Generated;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;


/**
 * <p>Original spec-file type: EachPathway</p>
 * 
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("com.googlecode.jsonschema2pojo")
@JsonPropertyOrder({
    "pathwayName",
    "pathwayId",
    "totalModelReactions",
    "totalKEGGRxns",
    "totalRxnFlux",
    "gsrFluxPExpP",
    "gsrFluxPExpN",
    "gsrFluxMExpP",
    "gsrFluxMExpM",
    "gpRxnsFluxP",
    "reaction_list"
})
public class EachPathway {

    @JsonProperty("pathwayName")
    private String pathwayName;
    @JsonProperty("pathwayId")
    private Long pathwayId;
    @JsonProperty("totalModelReactions")
    private Long totalModelReactions;
    @JsonProperty("totalKEGGRxns")
    private Long totalKEGGRxns;
    @JsonProperty("totalRxnFlux")
    private Long totalRxnFlux;
    @JsonProperty("gsrFluxPExpP")
    private Long gsrFluxPExpP;
    @JsonProperty("gsrFluxPExpN")
    private Long gsrFluxPExpN;
    @JsonProperty("gsrFluxMExpP")
    private Long gsrFluxMExpP;
    @JsonProperty("gsrFluxMExpM")
    private Long gsrFluxMExpM;
    @JsonProperty("gpRxnsFluxP")
    private Long gpRxnsFluxP;
    @JsonProperty("reaction_list")
    private List<EachReaction> reactionList;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("pathwayName")
    public String getPathwayName() {
        return pathwayName;
    }

    @JsonProperty("pathwayName")
    public void setPathwayName(String pathwayName) {
        this.pathwayName = pathwayName;
    }

    public EachPathway withPathwayName(String pathwayName) {
        this.pathwayName = pathwayName;
        return this;
    }

    @JsonProperty("pathwayId")
    public Long getPathwayId() {
        return pathwayId;
    }

    @JsonProperty("pathwayId")
    public void setPathwayId(Long pathwayId) {
        this.pathwayId = pathwayId;
    }

    public EachPathway withPathwayId(Long pathwayId) {
        this.pathwayId = pathwayId;
        return this;
    }

    @JsonProperty("totalModelReactions")
    public Long getTotalModelReactions() {
        return totalModelReactions;
    }

    @JsonProperty("totalModelReactions")
    public void setTotalModelReactions(Long totalModelReactions) {
        this.totalModelReactions = totalModelReactions;
    }

    public EachPathway withTotalModelReactions(Long totalModelReactions) {
        this.totalModelReactions = totalModelReactions;
        return this;
    }

    @JsonProperty("totalKEGGRxns")
    public Long getTotalKEGGRxns() {
        return totalKEGGRxns;
    }

    @JsonProperty("totalKEGGRxns")
    public void setTotalKEGGRxns(Long totalKEGGRxns) {
        this.totalKEGGRxns = totalKEGGRxns;
    }

    public EachPathway withTotalKEGGRxns(Long totalKEGGRxns) {
        this.totalKEGGRxns = totalKEGGRxns;
        return this;
    }

    @JsonProperty("totalRxnFlux")
    public Long getTotalRxnFlux() {
        return totalRxnFlux;
    }

    @JsonProperty("totalRxnFlux")
    public void setTotalRxnFlux(Long totalRxnFlux) {
        this.totalRxnFlux = totalRxnFlux;
    }

    public EachPathway withTotalRxnFlux(Long totalRxnFlux) {
        this.totalRxnFlux = totalRxnFlux;
        return this;
    }

    @JsonProperty("gsrFluxPExpP")
    public Long getGsrFluxPExpP() {
        return gsrFluxPExpP;
    }

    @JsonProperty("gsrFluxPExpP")
    public void setGsrFluxPExpP(Long gsrFluxPExpP) {
        this.gsrFluxPExpP = gsrFluxPExpP;
    }

    public EachPathway withGsrFluxPExpP(Long gsrFluxPExpP) {
        this.gsrFluxPExpP = gsrFluxPExpP;
        return this;
    }

    @JsonProperty("gsrFluxPExpN")
    public Long getGsrFluxPExpN() {
        return gsrFluxPExpN;
    }

    @JsonProperty("gsrFluxPExpN")
    public void setGsrFluxPExpN(Long gsrFluxPExpN) {
        this.gsrFluxPExpN = gsrFluxPExpN;
    }

    public EachPathway withGsrFluxPExpN(Long gsrFluxPExpN) {
        this.gsrFluxPExpN = gsrFluxPExpN;
        return this;
    }

    @JsonProperty("gsrFluxMExpP")
    public Long getGsrFluxMExpP() {
        return gsrFluxMExpP;
    }

    @JsonProperty("gsrFluxMExpP")
    public void setGsrFluxMExpP(Long gsrFluxMExpP) {
        this.gsrFluxMExpP = gsrFluxMExpP;
    }

    public EachPathway withGsrFluxMExpP(Long gsrFluxMExpP) {
        this.gsrFluxMExpP = gsrFluxMExpP;
        return this;
    }

    @JsonProperty("gsrFluxMExpM")
    public Long getGsrFluxMExpM() {
        return gsrFluxMExpM;
    }

    @JsonProperty("gsrFluxMExpM")
    public void setGsrFluxMExpM(Long gsrFluxMExpM) {
        this.gsrFluxMExpM = gsrFluxMExpM;
    }

    public EachPathway withGsrFluxMExpM(Long gsrFluxMExpM) {
        this.gsrFluxMExpM = gsrFluxMExpM;
        return this;
    }

    @JsonProperty("gpRxnsFluxP")
    public Long getGpRxnsFluxP() {
        return gpRxnsFluxP;
    }

    @JsonProperty("gpRxnsFluxP")
    public void setGpRxnsFluxP(Long gpRxnsFluxP) {
        this.gpRxnsFluxP = gpRxnsFluxP;
    }

    public EachPathway withGpRxnsFluxP(Long gpRxnsFluxP) {
        this.gpRxnsFluxP = gpRxnsFluxP;
        return this;
    }

    @JsonProperty("reaction_list")
    public List<EachReaction> getReactionList() {
        return reactionList;
    }

    @JsonProperty("reaction_list")
    public void setReactionList(List<EachReaction> reactionList) {
        this.reactionList = reactionList;
    }

    public EachPathway withReactionList(List<EachReaction> reactionList) {
        this.reactionList = reactionList;
        return this;
    }

    @JsonAnyGetter
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperties(String name, Object value) {
        this.additionalProperties.put(name, value);
    }

    @Override
    public String toString() {
        return ((((((((((((((((((((((((("EachPathway"+" [pathwayName=")+ pathwayName)+", pathwayId=")+ pathwayId)+", totalModelReactions=")+ totalModelReactions)+", totalKEGGRxns=")+ totalKEGGRxns)+", totalRxnFlux=")+ totalRxnFlux)+", gsrFluxPExpP=")+ gsrFluxPExpP)+", gsrFluxPExpN=")+ gsrFluxPExpN)+", gsrFluxMExpP=")+ gsrFluxMExpP)+", gsrFluxMExpM=")+ gsrFluxMExpM)+", gpRxnsFluxP=")+ gpRxnsFluxP)+", reactionList=")+ reactionList)+", additionalProperties=")+ additionalProperties)+"]");
    }

}
