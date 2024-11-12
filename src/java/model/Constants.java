/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Constants {

    public static String GOOGLE_CLIENT_ID = "393624416817-8crlnf1o21kjk410epg6pjg7q6bohd79.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET = "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";
    public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/quizonline/googlelogin";
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";
    public static String FACEBOOK_APP_ID = "881147463974671";
    public static String FACEBOOK_APP_SECRET = "7da5a374478a17ed4058e501338a519a";
    public static String FACEBOOK_REDIRECT_URL = "http://localhost:8080/quizonline/facebooklogin";
    public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/v20.0/oauth/access_token";
    public static String FACEBOOK_LINK_GET_USER_INFO = "https://graph.facebook.com/me/?fields=id,name,email&access_token=";
}
