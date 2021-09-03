package org.dotbase.dto;

import java.io.IOException;

import org.dotbase.dto.credential.TOTPDeviceNameData;
import org.dotbase.dto.credential.TOTPInitialCodeData;
import org.dotbase.dto.credential.TOTPSecretData;
import org.keycloak.credential.CredentialModel;
import org.keycloak.util.JsonSerialization;

public class TOTPCredentialModel extends CredentialModel {
  public static final String TYPE = "TOTP";

  private final TOTPSecretData secretData;
  private final TOTPDeviceNameData deviceNameData;
  private final TOTPInitialCodeData initialCodeData;

  private TOTPCredentialModel(TOTPSecretData secretData, TOTPDeviceNameData deviceNameData,
      TOTPInitialCodeData initialCodeData) {
    this.secretData = secretData;
    this.deviceNameData = deviceNameData;
    this.initialCodeData = initialCodeData;
  }

  private TOTPCredentialModel(String secretData, String deviceNameData, String initialCodeData) {
    this.secretData = new TOTPSecretData(secretData);
    this.deviceNameData = new TOTPDeviceNameData(deviceNameData);
    this.initialCodeData = new TOTPInitialCodeData(initialCodeData);
  }

//   public static TOTPCredentialModel createFromCredentialModel(TOTPCredentialModel credentialModel){
//     try {
//       TOTPSecretData secretData = JsonSerialization.readValue(credentialModel.getSecretData(), TOTPSecretData.class);
//       TOTPDeviceNameData deviceNameData = JsonSerialization.readValue(credentialModel.getOTPCredentialData().getDevice(),TOTPDeviceNameData.class);
//       TOTPInitialCodeData initialCodeData = JsonSerialization.readValue(credentialModel.getInitialCode(),TOTPInitialCodeData.class);

//       TOTPCredentialModel secretQuestionCredentialModel = new TOTPCredentialModel(secretData, deviceNameData, initialCodeData);
//         // secretQuestionCredentialModel.setUserLabel(credentialModel.getUserLabel());
//         // secretQuestionCredentialModel.setCreatedDate(credentialModel.getCreatedDate());
//         // secretQuestionCredentialModel.setType(TYPE);
//         // secretQuestionCredentialModel.setId(credentialModel.getId());
//         // secretQuestionCredentialModel.setSecretData(credentialModel.getSecretData());
//         // secretQuestionCredentialModel.setCredentialData(credentialModel.getCredentialData());
//         return secretQuestionCredentialModel;
//     } catch (IOException e){
//         throw new RuntimeException(e);
//     }
// }

  // public TOTPSecretData getSecret() {
  //   return this.secretData;
  // }

  // public TOTPDeviceNameData getDeviceName() {
  //   return this.deviceNameData;
  // }

  // public TOTPInitialCodeData getInitialCode() {
  //   return this.initialCodeData;
  // }
}
