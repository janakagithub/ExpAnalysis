
package us.kbase.modelanalysisexpession;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Generated;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;


/**
 * <p>Original spec-file type: EachPeg</p>
 * 
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("com.googlecode.jsonschema2pojo")
@JsonPropertyOrder({
    "pegId",
    "expression"
})
public class EachPeg {

    @JsonProperty("pegId")
    private String pegId;
    @JsonProperty("expression")
    private Double expression;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("pegId")
    public String getPegId() {
        return pegId;
    }

    @JsonProperty("pegId")
    public void setPegId(String pegId) {
        this.pegId = pegId;
    }

    public EachPeg withPegId(String pegId) {
        this.pegId = pegId;
        return this;
    }

    @JsonProperty("expression")
    public Double getExpression() {
        return expression;
    }

    @JsonProperty("expression")
    public void setExpression(Double expression) {
        this.expression = expression;
    }

    public EachPeg withExpression(Double expression) {
        this.expression = expression;
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
        return ((((((("EachPeg"+" [pegId=")+ pegId)+", expression=")+ expression)+", additionalProperties=")+ additionalProperties)+"]");
    }

}
