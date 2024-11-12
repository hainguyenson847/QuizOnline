/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.http.client.fluent.Form;

/**
 *
 * @author ADMIN
 */
public class RestFB {

    public static String getToken(String code) throws ClientProtocolException, IOException {
//    String link = String.format(Constants.FACEBOOK_LINK_GET_TOKEN, Constants.FACEBOOK_APP_ID, Constants.FACEBOOK_APP_SECRET, Constants.FACEBOOK_REDIRECT_URL, code);
//    String response = Request.Post (link).execute().returnContent().asString();
//    JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
//    String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        String response = Request.Post(Constants.FACEBOOK_LINK_GET_TOKEN)
                .bodyForm(Form.form()
                .add("client_id", Constants.FACEBOOK_APP_ID)
                .add("client_secret", Constants.FACEBOOK_APP_SECRET)
                .add("redirect_uri", Constants.FACEBOOK_REDIRECT_URL)
                .add("code", code).build()).execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

//    public static User getUserInfo(String accessToken) {
//        FacebookClient facebookClient = new DefaultFacebookClient(accessToken, Constants.FACEBOOK_APP_SECRET, Version.LATEST);
//        return facebookClient.fetchObject("me/feed", User.class);
//    }
     public static GooglePojo getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
    String link = Constants.FACEBOOK_LINK_GET_USER_INFO + accessToken;
    String response = Request.Get(link).execute().returnContent().asString();
    GooglePojo googlePojo = new Gson().fromJson(response, GooglePojo.class);
    return googlePojo;
  }
}
