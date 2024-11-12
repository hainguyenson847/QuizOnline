// VisitorCounterListener.java
package controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

@WebListener
public class VisitorCounterListener implements ServletContextListener, HttpSessionListener {

    private static final String COUNTER_FILE = "C:/Users/ADMIN/Documents/NetBeansProjects/QuizOnline/vistorData/visitorCount.json";
    private Gson gson = new Gson();

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        int visitorCount = readVisitorCount(context);
        context.setAttribute("visitorCount", visitorCount);
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        ServletContext context = se.getSession().getServletContext();
        synchronized (context) {
            Integer count = (Integer) context.getAttribute("visitorCount");
            count += 1;
            context.setAttribute("visitorCount", count);
            writeVisitorCount(context, count);
        }
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        // Optional: Handle session destruction if needed
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Cleanup if necessary
    }

    private int readVisitorCount(ServletContext context) {
        File file = new File( COUNTER_FILE);
        if (!file.exists()) {
            writeVisitorCount(context, 0);
            return 0;
        }
        try (FileReader reader = new FileReader(file)) {
            JsonObject json = gson.fromJson(reader, JsonObject.class);
            return json.get("visitorCount").getAsInt();
        } catch (IOException | NullPointerException e) {
            e.printStackTrace();
            return 0;
        }
    }

    private void writeVisitorCount(ServletContext context, int count) {
        File file = new File( COUNTER_FILE);
        JsonObject json = new JsonObject();
        json.addProperty("visitorCount", count);
        try (FileWriter writer = new FileWriter(file)) {
            gson.toJson(json, writer);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}