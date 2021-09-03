package org.dotbase.dto.credential;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class TOTPInitialCodeData {
    
  private final String initialCode;

  @JsonCreator
  public TOTPInitialCodeData(@JsonProperty("initialCode") String initialCode) {
    this.initialCode = initialCode;
  }

  public String getInitialCode() {
    return initialCode;
  }
}