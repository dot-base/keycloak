package org.dotbase.providers;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import org.dotbase.dto.TOTPCredentialModel;
import org.keycloak.models.RealmModel;
import org.keycloak.models.UserModel;
import org.keycloak.models.credential.OTPCredentialModel;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.utils.HmacOTP;
import org.keycloak.services.resource.RealmResourceProvider;
import org.keycloak.utils.CredentialHelper;
import org.keycloak.utils.TotpUtils;

public class TOTPProvider implements RealmResourceProvider {

  private KeycloakSession session;

  public TOTPProvider(KeycloakSession session) {
    this.session = session;
  }

  @Override
  public Object getResource() {
    return this;
  }

  @GET
  @Path("setup/{username}")
  @Produces("text/plain; charset=utf-8")
  public String getSetup(@PathParam("username") final String username) {
    final RealmModel realm = this.session.getContext().getRealm();
    final UserModel user = this.session.users().getUserByUsername(realm, username);
    final String totpSecret = HmacOTP.generateSecret(20);
    final String totpSecretQrCode = TotpUtils.qrCode(totpSecret, realm, user);
    return totpSecretQrCode;
  }

  // @POST
  // @Path("setup/{username}")
  // @Consumes("application/json")
  // public void addSetup(@PathParam("username") final String username, final OTPCredentialModel credentials) {
  //   final RealmModel realm = this.session.getContext().getRealm();
  //   final UserModel user = this.session.users().getUserByUsername(realm, username);
  //   final OTPCredentialModel otpCredentialModel = OTPCredentialModel.createFromPolicy(realm, credentials.getSecretData(), credentials.getUserLabel());
  //   CredentialHelper.createOTPCredential(this.session, realm, user, credentials.getInitialCode(), otpCredentialModel);
  // }

  @Override
  public void close() {
  }

}