
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
 * <p>Original spec-file type: PathwayData</p>
 * 
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("com.googlecode.jsonschema2pojo")
@JsonPropertyOrder({
    "pathwayType",
    "pathways"
})
public class PathwayData {

    @JsonProperty("pathwayType")
    private String pathwayType;
    @JsonProperty("pathways")
    private List<EachPathway> pathways;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("pathwayType")
    public String getPathwayType() {
        return pathwayType;
    }

    @JsonProperty("pathwayType")
    public void setPathwayType(String pathwayType) {
        this.pathwayType = pathwayType;
    }

    public PathwayData withPathwayType(String pathwayType) {
        this.pathwayType = pathwayType;
        return this;
    }

    @JsonProperty("pathways")
    public List<EachPathway> getPathways() {
        return pathways;
    }

    @JsonProperty("pathways")
    public void setPathways(List<EachPathway> pathways) {
        this.pathways = pathways;
    }

    public PathwayData withPathways(List<EachPathway> pathways) {
        this.pathways = pathways;
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
        return ((((((("PathwayData"+" [pathwayType=")+ pathwayType)+", pathways=")+ pathways)+", additionalProperties=")+ additionalProperties)+"]");
    }

}
