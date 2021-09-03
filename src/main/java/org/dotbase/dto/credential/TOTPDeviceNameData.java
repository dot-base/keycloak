package org.dotbase.dto.credential;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class TOTPDeviceNameData {
  private final String deviceName;

  @JsonCreator
  public TOTPDeviceNameData(@JsonProperty("deviceName") String deviceName) {
    this.deviceName = deviceName;
  }

  public String getdeviceName() {
    return deviceName;
  }
}