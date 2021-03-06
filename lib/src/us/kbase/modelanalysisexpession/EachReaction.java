
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
 * <p>Original spec-file type: EachReaction</p>
 * 
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("com.googlecode.jsonschema2pojo")
@JsonPropertyOrder({
    "id",
    "name",
    "flux",
    "gapfill",
    "expressed",
    "pegs"
})
public class EachReaction {

    @JsonProperty("id")
    private String id;
    @JsonProperty("name")
    private String name;
    @JsonProperty("flux")
    private Double flux;
    @JsonProperty("gapfill")
    private Long gapfill;
    @JsonProperty("expressed")
    private Long expressed;
    @JsonProperty("pegs")
    private List<EachPeg> pegs;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("id")
    public String getId() {
        return id;
    }

    @JsonProperty("id")
    public void setId(String id) {
        this.id = id;
    }

    public EachReaction withId(String id) {
        this.id = id;
        return this;
    }

    @JsonProperty("name")
    public String getName() {
        return name;
    }

    @JsonProperty("name")
    public void setName(String name) {
        this.name = name;
    }

    public EachReaction withName(String name) {
        this.name = name;
        return this;
    }

    @JsonProperty("flux")
    public Double getFlux() {
        return flux;
    }

    @JsonProperty("flux")
    public void setFlux(Double flux) {
        this.flux = flux;
    }

    public EachReaction withFlux(Double flux) {
        this.flux = flux;
        return this;
    }

    @JsonProperty("gapfill")
    public Long getGapfill() {
        return gapfill;
    }

    @JsonProperty("gapfill")
    public void setGapfill(Long gapfill) {
        this.gapfill = gapfill;
    }

    public EachReaction withGapfill(Long gapfill) {
        this.gapfill = gapfill;
        return this;
    }

    @JsonProperty("expressed")
    public Long getExpressed() {
        return expressed;
    }

    @JsonProperty("expressed")
    public void setExpressed(Long expressed) {
        this.expressed = expressed;
    }

    public EachReaction withExpressed(Long expressed) {
        this.expressed = expressed;
        return this;
    }

    @JsonProperty("pegs")
    public List<EachPeg> getPegs() {
        return pegs;
    }

    @JsonProperty("pegs")
    public void setPegs(List<EachPeg> pegs) {
        this.pegs = pegs;
    }

    public EachReaction withPegs(List<EachPeg> pegs) {
        this.pegs = pegs;
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
        return ((((((((((((((("EachReaction"+" [id=")+ id)+", name=")+ name)+", flux=")+ flux)+", gapfill=")+ gapfill)+", expressed=")+ expressed)+", pegs=")+ pegs)+", additionalProperties=")+ additionalProperties)+"]");
    }

}
