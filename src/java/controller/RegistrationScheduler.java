// File: RegistrationScheduler.java

import controller.RegistrationTask;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.time.*;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

@WebListener
public class RegistrationScheduler implements ServletContextListener {

    private ScheduledExecutorService scheduler;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        scheduler = Executors.newSingleThreadScheduledExecutor();

        //schedule the task to run daily at 9 AM
        long initialDelay = computeInitialDelay();
        long period = TimeUnit.DAYS.toSeconds(1);
        //
        scheduler.scheduleAtFixedRate(new RegistrationTask(), initialDelay, period, TimeUnit.SECONDS);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (scheduler != null) {
            scheduler.shutdownNow();
        }
    }

    /**
     * Computes the initial delay in seconds until the next 9 AM.
     */
    private long computeInitialDelay() {
        LocalDateTime now = LocalDateTime.now();
        //next 9 AM
        LocalDateTime nextRun = now.withHour(9).withMinute(0).withSecond(0).withNano(0);
        if (now.compareTo(nextRun) >= 0) {
            // If current time is after or exactly 9 AM, schedule for next day
            nextRun = nextRun.plusDays(1);
        }
        //Dủation between now and nextRun
        Duration duration = Duration.between(now, nextRun);
        return duration.getSeconds();
    }
}