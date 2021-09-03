package org.dotbase.dto.credential;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class TOTPSecretData {
  private final String secret;

  @JsonCreator
  public TOTPSecretData(@JsonProperty("secret") String secret) {
    this.secret = secret;
  }

  public String getSecret() {
    return secret;
  }
}
